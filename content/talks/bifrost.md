Date: 2019-05-15
Title: scripting BIFROST
Tags: observing, 20m
Author: Luis Velilla Prieto

## Observing with the Onsala 20m using scripting and BIFROST
 * The following (abbreviated) script was discussed:

```
# Define/import global settings
SETUP POINT loops=2 azdist=21 eldist=21 ontime=20 caltime=10 calwhen=3 obsmode=ssw dop=eachcal adjpwr=first rawdata=skip addpol=save backend=SPEa baseline=nobaselines startpos=last apply=auto
SETUP FOCUS loops=2 ontime=20 caltime=10 calwhen=3 obsmode=ssw dop=eachcal adjpwr=never rawdata=skip addpol=save backend=SPEa baseline=nobaselines startpos=current apply=auto
SETUP SINGLE loops=3 ontime=120 caltime=10 calwhen=3 obsmode=dsw adjpwr=first dop=eachcal rawdata=skip addpol=save average=addfile useplm=dontuse
MARKFILE myflags.mark
UNMARK isday
UNMARK isnight
ALERTME luis.velilla@chalmers.se
TIMESTAMP P1
WINDOW 20 75 30
MAXTSYS 1200
# P1 is set at the beginning of the observation
# P2 is set after a pointing
# P3 is set after a focus
#
# Pointing will be done if P2>90min (>90min have passed since last point) and also when starting a new source/setup.
# Focus will be done if P3>180min (3 hours since last focus), new source/setup, or if the sunrise/sunset have passed

REPEAT FOREVER
CATALOG scisources.cat
IF MARKED(wand_s2)<10 AND EL(W AND)>23 THEN
        CATALOG poi86future.cat
        LOAD siospeconfig4mm
       	IF EL(chi Cyg)>23 THEN
        	OBSERVE chi Cyg POINT
		TIMESTAMP P2
		OBSERVE chi Cyg FOCUS
		TIMESTAMP P3
        ELSEIF EL(R Cas)>23 THEN
	        OBSERVE R Cas POINT
		TIMESTAMP P2
		OBSERVE R Cas FOCUS
		TIMESTAMP P3
        ELSEIF EL(V Cam)>23 THEN
        	OBSERVE V Cam POINT
		TIMESTAMP P2
		OBSERVE V Cam FOCUS
		TIMESTAMP P3
	ELSEIF EL(TX Cam)>23 THEN
		OBSERVE TX Cam POINT
		TIMESTAMP P2
		OBSERVE TX Cam FOCUS
		TIMESTAMP P3
	ENDIF
	CATALOG scisources.cat
	SOURCE W AND
	REPEAT WHILE MARKED(wand_s2)<10 AND EL(W AND)>23
        	IF UTC>14/5@04:00:00 AND UTC<14/5@20:30:00 THEN
                	UNMARK isday
                	MARK isday
            	ELSE
                	UNMARK isnight
                	MARK isnight
            	ENDIF
            	CATALOG scisources.cat
		SOURCE W AND
		LOAD set2_4mm_72-86
		OBSERVE W AND SINGLE useplm=use
		MARK wand_s2
            	IF SINCE(P2)>90 THEN
	                CATALOG poi86future.cat
        	        LOAD siospeconfig4mm
	        	IF EL(chi Cyg)>23 THEN
        	    		OBSERVE chi Cyg POINT
	        	ELSEIF EL(R Cas)>23 THEN
                    		OBSERVE R Cas POINT
		        ELSEIF EL(V Cam)>23 THEN
			        OBSERVE V Cam POINT
		        ELSEIF EL(TX Cam)>23 THEN
			        OBSERVE TX Cam POINT
        		ENDIF
                	TIMESTAMP P2
            	ENDIF
            	IF MARKED(isday) AND UTC>14/5@20:30:00 AND UTC<15/5@04:00:00 THEN
                	CATALOG poi86future.cat
                	LOAD siospeconfig4mm
        		IF EL(chi Cyg)>23 THEN
	    	   		OBSERVE chi Cyg FOCUS
		        ELSEIF EL(R Cas)>23 THEN
                		OBSERVE R Cas FOCUS
		        ELSEIF EL(V Cam)>23 THEN
			        OBSERVE V Cam FOCUS
		        ELSEIF EL(TX Cam)>23 THEN
			        OBSERVE TX Cam FOCUS
	        	ENDIF
        	        TIMESTAMP P3
                	UNMARK isday
            	ELSEIF MARKED(isnight) AND UTC<15/5@20:30:00 AND UTC>15/5@04:00:00 THEN
                	CATALOG poi86future.cat
	                LOAD siospeconfig4mm
        		IF EL(chi Cyg)>23 THEN
			    	OBSERVE chi Cyg FOCUS
		        ELSEIF EL(R Cas)>23 THEN
        		        OBSERVE R Cas FOCUS
		        ELSEIF EL(V Cam)>23 THEN
			        OBSERVE V Cam FOCUS
		        ELSEIF EL(TX Cam)>23 THEN
			        OBSERVE TX Cam FOCUS
		       	ENDIF
                	TIMESTAMP P3
	                UNMARK isnight
        	ENDIF
	        IF SINCE(P3)>180 THEN
        	        CATALOG poi86future.cat
                	LOAD siospeconfig4mm
	        	IF EL(chi Cyg)>23 THEN
        			OBSERVE chi Cyg FOCUS
		        ELSEIF EL(R Cas)>23 THEN
        		        OBSERVE R Cas FOCUS
		        ELSEIF EL(V Cam)>23 THEN
			        OBSERVE V Cam FOCUS
		        ELSEIF EL(TX Cam)>23 THEN
	        		OBSERVE TX Cam FOCUS
	        	ENDIF
        	        TIMESTAMP P3
            	ENDIF
		CATALOG scisources.cat
	ENDREPEAT
ENDIF

MAXTSYS 1800
ENDREPEAT
```
