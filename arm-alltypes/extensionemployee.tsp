import "@typespec/rest";
import "@typespec/http";
import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";

using TypeSpec.Rest;
using TypeSpec.Http;
using Azure.Core;
using Azure.ResourceManager;

namespace {{parameters.ServiceNamespace}};

/** Employee resource */
model ExtensionEmployee is ExtensionResource<EmployeeProperties> {
  ...ResourceNameParameter<ExtensionEmployee>;
}

@armResourceOperations
interface ExtensionEmployees {
  get is ArmResourceRead<ExtensionEmployee>;
  list is ArmResourceListByParent<ExtensionEmployee>;
}
