package org.zzq.csm.entity.cms;

import org.zzq.csm.entity.common.BaseEntity;

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
    private String short_name;
    private String long_value;
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

    public String getShort_name() {
        return short_name;
    }

    public void setShort_name(String short_name) {
        this.short_name = short_name;
    }

    public String getLong_value() {
        return long_value;
    }

    public void setLong_value(String long_value) {
        this.long_value = long_value;
    }

    public int getIsactive() {
        return isactive;
    }

    public void setIsactive(int isactive) {
        this.isactive = isactive;
    }
}
