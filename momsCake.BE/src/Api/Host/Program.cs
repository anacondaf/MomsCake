using System.Text.Json.Serialization;
using FluentValidation.AspNetCore;
using Host.Configurations;
using Host.Extensions;
using Infrastructure;

var builder = WebApplication.CreateBuilder(args);

builder.Configuration.AddJsonConfiguration();

builder.Services.AddFluentValidationAutoValidation().AddControllers();

builder.Services
    .HostBuilderService(builder.Configuration)
    .AddApplicationServices();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.MapControllers();

app.Run();