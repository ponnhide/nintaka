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
// written by Koichi Takahashi <shafi@e-cell.org>,
// E-Cell Project.
//

#include <libecs/Variable.hpp>

#include <libecs/DifferentialStepper.hpp>
#include "Model.hpp"

USE_LIBECS;

LIBECS_DM_CLASS( ClampFixedODE1Stepper, DifferentialStepper )
{
    
public:
    
    LIBECS_DM_OBJECT( ClampFixedODE1Stepper, Stepper )
    {
        INHERIT_PROPERTIES( DifferentialStepper );
        PROPERTYSLOT_SET_GET( Real, MaxStepInterval );
        PROPERTYSLOT_SET_GET( Real, MinStepInterval );
        PROPERTYSLOT_SET_GET( Real, a );
        PROPERTYSLOT_SET_GET( Real, b );
        PROPERTYSLOT_SET_GET( Real, c );      
        PROPERTYSLOT_SET_GET( Real, onset );
        PROPERTYSLOT_SET_GET( Real, offset );
        PROPERTYSLOT_SET_GET( Real, interval );
    }
    
    ClampFixedODE1Stepper()
        :
        MaxStepInterval( 0.01 ),
        MinStepInterval( 0.0001 ),
        a( 0.01 ),
        b( 0.1 ),
        onset( 10.0 ),
        offset( 11.0 ),
        interval( 1000.0 )
    {
        ; // do nothing
    }
    SIMPLE_SET_GET_METHOD( Real, MaxStepInterval );
    SIMPLE_SET_GET_METHOD( Real, MinStepInterval );
    SIMPLE_SET_GET_METHOD( Real, a ); 
    SIMPLE_SET_GET_METHOD( Real, b );
    SIMPLE_SET_GET_METHOD( Real, c );
    SIMPLE_SET_GET_METHOD( Real, onset );
    SIMPLE_SET_GET_METHOD( Real, offset );
    SIMPLE_SET_GET_METHOD( Real, interval );
    
    
    virtual ~ClampFixedODE1Stepper(){
    }
    virtual void initialize()
    {
                DifferentialStepper::initialize();
		if ( onset >= getCurrentTime() ) {
		
			_nextOnset = onset;
                        _firstOnset = onset;
		
		} else {

			_nextOnset = onset + floor( ( getCurrentTime() - onset ) / interval ) * interval;
                        _firstOnset = onset;
		}

		_nextOffset = _nextOnset + offset - onset;  
                _stepinterval = 0; 
         //std::cout << _nextOnset << std::endl;    
        ; // do nothing
    }
    
    virtual void updateInternalState( Real aStepInterval )
    {
        _t = getCurrentTime();  
        //std::cout << _nextOnset << std::endl;   
        
        const VariableVector::size_type aSize( getReadOnlyVariableOffset() );  
        clearVariables();                       
        fireProcesses();
        setVariableVelocity( theTaylorSeries[ 0 ] );       
        DifferentialStepper::updateInternalState( aStepInterval );   
        //setNextTime( _t + 0.001 );  
         if ( _t >= _nextOnset - a *  interval || _nextOnset - _t > interval - b * interval || _t < _firstOnset ){
            _stepinterval = MinStepInterval;
	    setNextTime( _t + MinStepInterval );
	} 
        else{ 
            if( _stepinterval < MaxStepInterval ){
                _stepinterval += MinStepInterval * c;
                setNextTime( _t + _stepinterval );
            }
            //std::cout << _t << std::endl; 
            else  
                setNextTime( _t + MaxStepInterval ); 
        }
        
        if ( _t >= _nextOffset ) {
            _nextOnset  += interval;
            _nextOffset += interval;
        }                           
    }
    
protected:
    Real MaxStepInterval;
    Real MinStepInterval;
    Real a;
    Real b;
    Real c;
    Real onset;
    Real offset;
    Real interval;
    
    
private:
    Real _t;
    Real _nextOnset;
    Real _nextOffset;
    Real _stepinterval;
    Real _firstOnset;

};

LIBECS_DM_INIT( ClampFixedODE1Stepper, Stepper );
