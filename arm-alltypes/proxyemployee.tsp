import "@typespec/rest";
import "@typespec/http";
import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";

using TypeSpec.Rest;
using TypeSpec.Http;
using Azure.Core;
using Azure.ResourceManager;

namespace {{parameters.ServiceNamespace}};

model ProxyEmployee is ProxyResource<EmployeeProperties> {
    ...ResourceNameParameter<ProxyEmployee>;
}

@armResourceOperations
interface ProxyEmployees {
  get is ArmResourceRead<ProxyEmployee>;
  list is ArmResourceListByParent<ProxyEmployee>;
}
