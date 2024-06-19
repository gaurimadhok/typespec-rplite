import "@typespec/rest";
import "@typespec/versioning";
import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";
import "./locationbasedemployee.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.Versioning;
using Azure.Core;
using Azure.ResourceManager;

/** {{parameters.ServiceNamespace}} Resource Provider management API. */
@armProviderNamespace
@service({
  title: "{{parameters.ServiceNamespace}} management service",
})
@versioned(Versions)
namespace {{parameters.ServiceNamespace}};

/** Contoso API versions */
enum Versions {
  /** 2021-10-01-preview version */
  @useDependency(Azure.ResourceManager.Versions.v1_0_Preview_1)
  @useDependency(Azure.Core.Versions.v1_0_Preview_2)
  @armCommonTypesVersion(Azure.ResourceManager.CommonTypes.Versions.v5)
  `2021-10-01-preview`,
}

model ExtensionEmployee is ExtensionResource<EmployeeProperties> {
  ...ResourceNameParameter<ExtensionEmployee>;
}

model ProxyEmployee is ProxyResource<EmployeeProperties> {
  ...ResourceNameParameter<ProxyEmployee>;
}

@tenantResource
model TenantProxyEmployee is ProxyResource<EmployeeProperties> {
  ...ResourceNameParameter<TenantProxyEmployee>;
}

/** Employee properties */
model EmployeeProperties {
  /** Age of employee */
  age?: int32;

  /** City of employee */
  city?: string;

  /** Profile of employee */
  @encode("base64url")
  profile?: bytes;

  /** The status of the last operation. */
  @visibility("read")
  provisioningState?: ProvisioningState;
}

/** The provisioning state of a resource. */
@lroStatus
union ProvisioningState {
  ResourceProvisioningState,

  /** The resource is being provisioned */
  Provisioning: "Provisioning",

  /** The resource is updating */
  Updating: "Updating",

  /** The resource is being deleted */
  Deleting: "Deleting",

  /** The resource create request has been accepted */
  Accepted: "Accepted",

  string,
}

interface Operations extends Azure.ResourceManager.Operations {}

@armResourceOperations
interface ExtensionEmployees {
  get is ArmResourceRead<ExtensionEmployee>;
  list is ArmResourceListByParent<ExtensionEmployee>;
}

@armResourceOperations
interface ProxyEmployees {
  get is ArmResourceRead<ProxyEmployee>;
  list is ArmResourceListByParent<ProxyEmployee>;
}

@armResourceOperations
interface TenantProxyEmployees {
  get is ArmResourceRead<TenantProxyEmployee>;
  list is ArmResourceListByParent<TenantProxyEmployee>;
}
