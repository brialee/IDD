using AdminUI.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using NUnit.Framework;
using Xunit;
using AdminUI.Controllers;

namespace AdminUITest
{
    public class Timesheets_UnitTest
    {
        [Fact]
        public async Task Details_ReturnsNotFound()
        {
            // Arrange
            NotFoundResult expected;
            Nullable<int> nullId = null;
            // Act
            IActionResult actionResult = TimesheetsController.Details(nullId);
            // Assert
            Assert.IsType<NotFoundResult>(actionResult);
        }
    }
}
