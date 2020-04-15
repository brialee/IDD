using NUnit.Framework;
using System;
using System.IO;
using AdminUI.Controllers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using AdminUI.Data;
using Microsoft.Extensions.Logging.Abstractions;
using Microsoft.EntityFrameworkCore;
using Moq;
using AutoFixture;

namespace AdminUI.Tests
{

    [TestFixture]
    public class TimesheetsControllerTests
    {

        private readonly TimesheetContext _dbcontext;
        private readonly Controller _controller;

        public TimesheetsControllerTests()
        {
            _dbcontext = new InMemoryDbContextFactory().GetTimesheetContext();
            _controller = new TimesheetsController(_dbcontext);
        }

       [Test]
        public async System.Threading.Tasks.Task IndexTest_IsNotNullAsync()
        {
            var tsc = new TimesheetsController(_dbcontext);
            var result = (ViewResult)await tsc.Index();
            Assert.IsNotNull(result);
        }

        [Test]
        public void CreateTest_IsNotNull()
        {
            var tsc = new TimesheetsController(_dbcontext);
            var result = (ViewResult)tsc.Create();
            Assert.IsNotNull(result);
        }
    }
}