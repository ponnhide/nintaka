//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//
//       This file is part of the E-Cell System
//
//       Copyright (C) 1996-2014 Keio University
//       Copyright (C) 2008-2014 RIKEN
//       Copyright (C) 2005-2009 The Molecular Sciences Institute
//
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//
//
// E-Cell System is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public
// License as published by the Free Software Foundation; either
// version 2 of the License, or (at your option) any later version.
// 
// E-Cell System is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
// See the GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public
// License along with E-Cell System -- see the file COPYING.
// If not, write to the Free Software Foundation, Inc.,
// 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
// 
//END_HEADER
//
// authors:
//    Tatsuya Ishida
//
// E-Cell Project.
//

#include <libecs/ContinuousProcess.hpp>
#include "/home/localadmin/ecell3/ecell/dm/SingleExpressionProcessBase.hpp"

USE_LIBECS;

LIBECS_DM_CLASS_MIXIN( ExpressionAssignmentContinuousProcess, ContinuousProcess,
                       SingleExpressionProcessBase )
{
public:
    LIBECS_DM_OBJECT( ExpressionAssignmentContinuousProcess, Process )
    {
        INHERIT_PROPERTIES( ContinuousProcess );
        INHERIT_PROPERTIES( _LIBECS_MIXIN_CLASS_ );
        CLASS_DESCRIPTION("ExpressionAssignmentContinuousProcess is designed for easy and efficient representations of continuous flux rate equations.    \"Expression\" property accepts a plain text rate expression.    The expression must be evaluated to give a flux rate in number per second, not concentration per second.");
    	PROPERTYSLOT_SET_GET( String, mathml );

    }

    ExpressionAssignmentContinuousProcess()
    {
        //FIXME: additional properties:
        // Unidirectional     -> call declareUnidirectional() in initialize()
        //                                         if this is set
    }

    virtual ~ExpressionAssignmentContinuousProcess()
    {
        ; // do nothing
    }

    SET_METHOD( libecs::String, mathml )
    {
        theMathml = value;
    }

    GET_METHOD( libecs::String, mathml )
    {
        return theMathml;
    }


    virtual void initialize()
    {
        theVirtualMachine.setModel( getModel() );
        
        _LIBECS_MIXIN_CLASS_::initialize();
        ContinuousProcess::initialize();
        LastTime = getModel()->getCurrentTime();
        for( VariableReferenceVector::const_iterator i(
                    getVariableReferenceVector().begin() );
             i != getVariableReferenceVector().end(); ++i )
        {
            if( i->getCoefficient() != 0 )
            {
                theVariableReference = *i;
                return;
            }
        }   
        CurrentValue  = theVariableReference.getVariable()->getValue();    
        NextValue     = theVariableReference.getCoefficient() * theVirtualMachine.execute( *theCompiledCode );     
        THROW_EXCEPTION_INSIDE(InitializationFailed, "No variable references with non-zero coefficients exist");  

    }

    virtual void defaultSetProperty( libecs::String const& aPropertyName,
                                     libecs::Polymorph const& aValue )
    {
        return _LIBECS_MIXIN_CLASS_::defaultSetProperty( aPropertyName, aValue );
    }

    virtual libecs::Polymorph defaultGetProperty( libecs::String const& aPropertyName ) const
    {
        return _LIBECS_MIXIN_CLASS_::defaultGetProperty( aPropertyName );
    }

    virtual std::vector< libecs::String > defaultGetPropertyList() const
    {
        return _LIBECS_MIXIN_CLASS_::defaultGetPropertyList();
    }

    virtual libecs::PropertyAttributes
    defaultGetPropertyAttributes( libecs::String const& aPropertyName ) const
    {
        return _LIBECS_MIXIN_CLASS_::defaultGetPropertyAttributes( aPropertyName );
    }

    virtual void fire()
    { 
        aStepInterval = getModel()->getCurrentTime() - LastTime;           
        NextValue     = theVariableReference.getCoefficient() * theVirtualMachine.execute( *theCompiledCode );                      
        if( aStepInterval > 0 ){    
           //std::cout<<CurrentValue<<std::endl;  
           //std::cout<<NextValue<<std::endl;  
           //std::cout<<111111<<std::endl;  
           setFlux( ( NextValue - CurrentValue ) / aStepInterval );       
        }  
        CurrentValue  = theVariableReference.getCoefficient() * theVirtualMachine.execute( *theCompiledCode ); 
        theVariableReference.getVariable()->setValue( NextValue );  
        LastTime = getModel()->getCurrentTime();  
    }
private:
    Real CurrentValue;    
    Real aStepInterval;     
    Real NextValue;    
    Real LastTime;
    String theVariable;
    String theMathml;
    VariableReference theVariableReference;  
};

LIBECS_DM_INIT( ExpressionAssignmentContinuousProcess, Process );
