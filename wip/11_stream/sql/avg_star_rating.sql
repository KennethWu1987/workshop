CREATE OR REPLACE STREAM "AVG_STAR_RATING_SQL_STREAM" (avg_star_rating DOUBLE);

CREATE OR REPLACE PUMP "AVG_STAR_RATING_STREAM_PUMP" AS 

INSERT INTO "AVG_STAR_RATING_SQL_STREAM" 
    SELECT STREAM 
        AVG(CAST("star_rating" AS DOUBLE) AS avg_star_rating
    FROM 
        "firehose_001"
    GROUP BY
        STEP("firehose_001".ROWTIME BY INTERVAL '30' SECOND);