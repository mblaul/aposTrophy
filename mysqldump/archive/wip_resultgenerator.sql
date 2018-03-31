CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_submitSimExam`(
	IN user_id BIGINT(20),
    IN optid VARCHAR(1),
    IN qid VARCHAR(11)
)
BEGIN
	@datenow = SELECT NOW();

	insert into result
		(
			USER_ID,
			RESULT_LINE_ID,
			RESULT_DATE,
			TEST_TYPE,
			TEST_SKILL_LVL,
			TEST_AREA
        )
		values
        (
			user_id,
            'test',
            @datenow,
            'sim',
            'wip',
            'wip'
        );
        
        @lastresid = SELECT RESULT_ID FROM result ORDER BY RESULT_ID DESC LIMIT 1;
        
	insert into result_line
        (
			RESULT_LINE_ID,
			OPTION_ID,
            QUESTION_ID
            
        )
        values
        (
			rslid,
            optid,
            qid
        );
END