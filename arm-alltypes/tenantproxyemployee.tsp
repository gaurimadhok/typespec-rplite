import "@typespec/rest";
import "@typespec/http";
import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";

using TypeSpec.Rest;
using TypeSpec.Http;
using Azure.Core;
using Azure.ResourceManager;

namespace {{parameters.ServiceNamespace}};

@tenantResource
model TenantProxyEmployee is ProxyResource<EmployeeProperties> {
  ...ResourceNameParameter<TenantProxyEmployee>;
}

@armResourceOperations
interface TenantProxyEmployees {
  get is ArmResourceRead<TenantProxyEmployee>;
  list is ArmResourceListByParent<TenantProxyEmployee>;
}
