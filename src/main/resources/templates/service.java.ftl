package ${package.Service};

import cn.zzzhzzjcpt.self.common.entity.PageParam;
import cn.zzzhzzjcpt.self.common.entity.Result;
import ${package.Entity}.${entity};
import ${superServiceClassPackage};
import com.github.pagehelper.PageInfo;

/**
 * <p>
 * ${table.comment!} 服务类
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
<#if kotlin>
interface ${table.serviceName} : ${superServiceClass}<${entity}>
<#else>
public interface ${table.serviceName} extends ${superServiceClass}<${entity}> {

</#if>
    /**
    * 获取${table.comment!}
    *
    * @param entity 查询参数
    * @return ${table.comment!}
    */
    Result<${entity}> getDetail(${entity} entity);

    /**
    * 分页获取 ${table.comment!}
    *
    * @param page  分页参数
    * @param entity 查询参数
    * @return ${table.comment!}
    */
    PageInfo<${entity}> getPage(PageParam page, ${entity} entity);
}
