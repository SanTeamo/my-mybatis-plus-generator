package ${package.ServiceImpl};

import cn.zzzhzzjcpt.common.util.PageHelperExt;
import cn.zzzhzzjcpt.self.common.entity.PageParam;
import cn.zzzhzzjcpt.self.common.entity.Result;
import ${package.Entity}.${entity};
import ${package.Mapper}.${table.mapperName};
import ${package.Service}.${table.serviceName};
import ${superServiceImplClassPackage};
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

/**
 * <p>
 * ${table.comment!} 服务实现类
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
@Service
<#if kotlin>
open class ${table.serviceImplName} : ${superServiceImplClass}<${table.mapperName}, ${entity}>(), ${table.serviceName} {

<#else>
public class ${table.serviceImplName} extends ${superServiceImplClass}<${table.mapperName}, ${entity}> implements ${table.serviceName} {

</#if>
    @Override
    public Result<${entity}> getDetail(${entity} entity) {
        if (entity.getId() == null) {
            return Result.fail("ID不能为空");
        }
        ${entity} notice = baseMapper.selectById(entity.getId());
        return Result.data(notice);
    }

    @Override
    public PageInfo<${entity}> getPage(PageParam page, ${entity} entity) {
        return PageHelperExt.startPage(page).doSelectPageInfo(() -> baseMapper.selectList(Wrappers.lambdaQuery(entity)));
    }
}
