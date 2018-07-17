package org.zzq.csm.entity.cms;

import org.zzq.csm.entity.common.BaseEntity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description:cms_code
 * User: TYLER
 * Date: 2018-07-04
 */
public class CmsCodes extends BaseEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id;
    private String typename;
    private String description;

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
