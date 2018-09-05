package org.zzq.csm.dao.quartz;
import org.zzq.csm.entity.quartz.ScheduleJob;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-09-05
 */
public interface ScheduleJobMapper {
    List<ScheduleJob> select(Long jobId);
    ScheduleJob selectByPrimaryKey(Long jobId);
    void insertSelective(ScheduleJob job);
    void updateByPrimaryKeySelective(ScheduleJob job);
    void deleteByPrimaryKeySelective(ScheduleJob job);
}
