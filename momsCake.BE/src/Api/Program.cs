using Api.Benchmark;
using Api.Configurations;
using Api.Infrastructure.Db;
using BenchmarkDotNet.Running;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddControllers();

builder.Configuration.AddJsonConfiguration();

builder.Services.AddPersistence(builder.Configuration);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.StartBenchmarking(app.Configuration);

app.MapControllers();

app.Run();