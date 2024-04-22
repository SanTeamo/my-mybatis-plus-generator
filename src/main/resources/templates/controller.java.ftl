package ${package.Controller};

import cn.zzzhzzjcpt.self.common.entity.PageParam;
import cn.zzzhzzjcpt.self.common.entity.Result;
import ${package.Entity}.${entity};
import ${package.Service}.${table.serviceName};
<#if restControllerStyle>
<#else>
import org.springframework.stereotype.Controller;
</#if>
<#if superControllerClassPackage??>
import ${superControllerClassPackage};
</#if>
import com.github.pagehelper.PageInfo;
<#if swagger>
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
</#if>
<#if entityLombokModel>
import lombok.RequiredArgsConstructor;
<#else>
import org.springframework.beans.factory.annotation.Autowired;
</#if>
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * ${table.comment!} 前端控制器
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
<#if restControllerStyle>
@RestController
<#else>
@Controller
</#if>
@RequestMapping("<#if package.ModuleName?? && package.ModuleName != "">/${package.ModuleName}</#if>/<#if controllerMappingHyphenStyle>${controllerMappingHyphen}<#else>${table.entityPath}</#if>")
<#if entityLombokModel>
@RequiredArgsConstructor
</#if>
<#if kotlin>
class ${table.controllerName}<#if superControllerClass??> : ${superControllerClass}()</#if>
<#else>
<#if superControllerClass??>
public class ${table.controllerName} extends ${superControllerClass} {
<#else>
public class ${table.controllerName} {
</#if>
    <#if entityLombokModel>
    private final ${table.serviceName} service;
    <#else>
    @Autowired
    private ${table.serviceName} service;
    </#if>

</#if>
    /**
    * 获取${table.comment!}
    *
    * @param entity 查询参数
    * @return ${table.comment!}
    */
    @GetMapping("/detail")
    @ApiOperation(value = "获取${table.comment!}", notes = "传入${entity}")
    public Result<${entity}> getDetail(${entity} entity) {
        return service.getDetail(entity);
    }

    /**
    * 分页获取 ${table.comment!}
    *
    * @param page  分页参数
    * @param entity 查询参数
    * @return ${table.comment!}
    */
    @GetMapping("/page")
    @ApiOperation(value = "分页获取${table.comment!}", notes = "传入${entity}")
    @ApiImplicitParams({
    @ApiImplicitParam(paramType = "query", name = "page", value = "页码", dataTypeClass = Integer.class),
    @ApiImplicitParam(paramType = "query", name = "limit", value = "每页数目", dataTypeClass = Integer.class),
    @ApiImplicitParam(paramType = "query", name = "orderBy", value = "排序字段", dataTypeClass = Integer.class),
    })
    public Result<PageInfo<${entity}>> getPage(PageParam page, ${entity} entity) {
    return Result.data(service.getPage(page, entity));
    }

    /**
    * 新增或修改${table.comment!}
    *
    * @param entity ${table.comment!}
    * @return 新增或修改结果
    */
    @PostMapping("/submit")
    @ApiOperation(value = "新增或修改", notes = "传入${entity}")
    public Result<?> submit(@RequestBody ${entity} entity) {
    return Result.status(service.saveOrUpdate(entity));
    }
}
