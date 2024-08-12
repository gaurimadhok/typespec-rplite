import "@typespec/rest";
import "@typespec/http";
import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";

using TypeSpec.Rest;
using TypeSpec.Http;
using Azure.Core;
using Azure.ResourceManager;

namespace {{parameters.ServiceNamespace}};

@parentResource(TenantLocationResource)
model LocationBasedEmployee is ProxyResource<EmployeeProperties> {
  ...ResourceNameParameter<LocationBasedEmployee>;
}

@armResourceOperations
interface LocationBasedEmployee {
  get is ArmResourceRead<LocationBasedEmployee>;
  listByLocation is ArmResourceListByParent<LocationBasedEmployee>;
}
