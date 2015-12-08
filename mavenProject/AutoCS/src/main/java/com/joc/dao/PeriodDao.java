package com.joc.dao;


import com.joc.domain.Period;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PeriodDao extends BaseDao<Period>{
    private final String GET_PeriodId = "from Period p where p.periodId = ?";

    public Period getPeriodId(String periodId){
        List<Period> periods = (List<Period>) find(GET_PeriodId, periodId);
        if (periods.size() == 0) {
            return null;
        } else {
            return periods.get(0);
        }
    }
}
