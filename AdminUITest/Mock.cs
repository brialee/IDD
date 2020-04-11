using System;

namespace AdminUITest
{
    internal class Mock<T>
    {
        public Mock()
        {
        }

        internal object Setup(Func<object, object> p)
        {
            throw new NotImplementedException();
        }
    }
}