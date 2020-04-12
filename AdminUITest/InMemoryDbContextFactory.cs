using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using AdminUI.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using AdminUI.Models;
using Amazon.DeviceFarm.Model;
using Amazon.DirectConnect.Model;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Internal;
using SQLitePCL;
using Microsoft.Extensions.Logging.Abstractions;


public class InMemoryDbContextFactory
    {
        public TimesheetContext GetTimesheetContext()
        {
            var options = new DbContextOptionsBuilder<TimesheetContext>()
                        .UseInMemoryDatabase(databaseName: "InMemoryArticleDatabase")
                        .Options;
        var dbContext = new TimesheetContext(options);
            return dbContext;
        }
    }
