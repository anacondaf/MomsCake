namespace Domain.Attributes;

/// <summary>
/// Used in conjunction with OpenApiEnumSchemaFilter to apply the enum property
/// to an OpenAPI schema.
/// </summary>
[AttributeUsage(AttributeTargets.Property)]
public class OpenApiEnumAttribute : Attribute
{
    public OpenApiEnumAttribute(params string[] enumOptions)
    {
        EnumOptions = enumOptions;
    }
    
    public OpenApiEnumAttribute(Type enoom)
    {
        if (!enoom.IsEnum)
        {
            throw new ArgumentException("Type not an enum", nameof(enoom));
        }
        EnumOptions = Enum.GetNames(enoom);
    }
    
    /// <summary>
    /// Options for values that the property can have
    /// </summary>
    public string[] EnumOptions { get; }
}