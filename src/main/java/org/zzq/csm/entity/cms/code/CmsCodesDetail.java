package org.zzq.csm.entity.cms.code;

import org.zzq.csm.entity.common.BaseEntity;
import org.zzq.csm.entity.common.ExtEntity;

import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * Description:cms_code_detail
 * User: TYLER
 * Date: 2018-07-04
 */
public class CmsCodesDetail extends BaseEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id;
    private String typename;
    private String codename;
    private String description;
    private String shortvalue; //注意，在数据库中存放的字段是short_value,而java代码中在默认情况下需要去掉下划线，否则无法进行访问
    private String longvalue;
    private int isactive;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public String getCodename() {
        return codename;
    }

    public void setCodename(String codename) {
        this.codename = codename;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getShortvalue() {
        return shortvalue;
    }

    public void setShortvalue(String shortvalue) {
        this.shortvalue = shortvalue;
    }

    public String getLongvalue() {
        return longvalue;
    }

    public void setLongvalue(String longvalue) {
        this.longvalue = longvalue;
    }


    public int getIsactive() {
        return isactive;
    }

    public void setIsactive(int isactive) {
        this.isactive = isactive;
    }
}
