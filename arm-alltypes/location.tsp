import "@azure-tools/typespec-azure-resource-manager";

using Azure.ResourceManager;

namespace {{parameters.ServiceNamespace}};

interface Locations extends Azure.ResourceManager.Locations {}
