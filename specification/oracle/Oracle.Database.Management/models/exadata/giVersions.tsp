using Azure.ResourceManager;
using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.Versioning;

namespace Oracle.Database;

@doc("GiVersion resource definition")
@parentResource(SubscriptionLocationResource)
model GiVersion is ProxyResource<GiVersionProperties> {
  @doc("GiVersion name")
  @key("giversionname")
  @path
  @segment("giVersions")
  @pattern(".*")
  name: string;
}

#suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-provisioning-state" "Read-only resource. No provisioning state provided."
@doc("GiVersion resource model")
model GiVersionProperties {
  @doc("A valid Oracle Grid Infrastructure (GI) software version.")
  @minLength(1)
  @maxLength(255)
  version: string;
}

@added(Versions.v20241201_preview)
@doc("Provides GiVersion query parameter for list operations.")
model GiVersionFilter {
  @query
  @doc("If provided, filters the results for the given shape")
  @minLength(1)
  @maxLength(255)
  shape?: SystemShapes;

  @query
  @doc("Filters the result for the given Azure Availability Zone")
  zone?: string;
}
