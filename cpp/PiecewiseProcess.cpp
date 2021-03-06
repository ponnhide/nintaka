//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//
//       This file is part of the E-Cell System
//
//       Copyright (C) 1996-2015 Keio University
//       Copyright (C) 2008-2015 RIKEN
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
#include "SingleExpressionProcessBase.hpp"

USE_LIBECS;

LIBECS_DM_CLASS_MIXIN( PiecewiseProcess, Process,
                       SingleExpressionProcessBase )
{
public:
    LIBECS_DM_OBJECT( PiecewiseProcess, Process )
    {
        INHERIT_PROPERTIES( _LIBECS_MIXIN_CLASS_ );
        INHERIT_PROPERTIES( Process );
        PROPERTYSLOT_SET_GET( String, Variable );
        PROPERTYSLOT_SET_GET( String, FireFlag );
	PROPERTYSLOT_SET_GET( String, TriggerFlag ); 
        PROPERTYSLOT_SET_GET( String, mathml ); 

    }

    PiecewiseProcess()
       :theFireFlag( "true" ),  
        theTriggerFlag( "false" ) 
    {
        //FIXME: additional properties:
        // Unidirectional     -> call declareUnidirectional() in initialize()
        //                                         if this is set
    }

    virtual ~PiecewiseProcess()
    {
        // ; do nothing
    }
 
    SET_METHOD( String, Variable )
    {
        theVariable = value;
    }

    GET_METHOD( String, Variable )
    {
        return theVariable;
    }

    SET_METHOD( libecs::String, FireFlag )
    {
        theFireFlag = value;
    }

    GET_METHOD( libecs::String, FireFlag )
    {
        return theFireFlag;
    }

    SET_METHOD( libecs::String, TriggerFlag )
    {
        theTriggerFlag = value;
    }

    GET_METHOD( libecs::String, TriggerFlag )
    {
        return theTriggerFlag;
    }
    
    SET_METHOD( libecs::String, mathml )
    {
        theMathml = value;
    }

    GET_METHOD( libecs::String, mathml )
    {
        return theMathml;
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

    virtual void initialize()
    {
        theVirtualMachine.setModel( getModel() );
        
        Process::initialize();
        _LIBECS_MIXIN_CLASS_::initialize();
        
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
        THROW_EXCEPTION_INSIDE(InitializationFailed, "No variable references with non-zero coefficients exist");
    }

    virtual void fire()
    { 
        theVariableReference.getVariable()->setValue(
            theVariableReference.getCoefficient() * 
                theVirtualMachine.execute( *theCompiledCode ) );
        if( previousValue != theVariableReference.getVariable()->getValue())
        {
            //std::cout<<"hoge"<<std::endl;
	    theTriggerFlag = "false";
            theFireFlag    = "true";
        }else{
            theTriggerFlag = "false";
            theFireFlag    = "false";
        } 
        if( getStepper()->getCurrentTime() == getModel()->getCurrentTime() ){ 
            previousValue = theVariableReference.getVariable()->getValue();
        }
    }
protected:
    String  theFireFlag;
    String  theTriggerFlag;

private:
    String theVariable;
    String theMathml;
    VariableReference theVariableReference;
    Real previousValue;
};

LIBECS_DM_INIT( PiecewiseProcess, Process );
