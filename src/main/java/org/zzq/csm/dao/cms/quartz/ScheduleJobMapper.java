package org.zzq.csm.dao.cms.quartz;
import org.zzq.csm.entity.cms.quartz.ScheduleJob;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-09-05
 */
public interface ScheduleJobMapper {
    List<ScheduleJob> selectAll();
    List<Map<String,Object>> selectAllHashMap();
    ScheduleJob selectById(int id);
    void insertScheduleJob(ScheduleJob job);
    void updateScheduleJob(ScheduleJob job);
    void deleteScheduleJobById(int id);
    void deleteScheduleJobByJobName(String jobName);
}
