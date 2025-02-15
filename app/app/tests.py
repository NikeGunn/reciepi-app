from django.test import SimpleTestCase
from app import calc

class CalcTests(SimpleTestCase):
    def test_add(self):
        """Test that two numbers are added together"""
        
        # res = calc.add(3, 8)
        # self.assertEqual(res, 11)

        # The above code can be written in one line as below
        self.assertEqual(calc.add(3, 8), 11)


    def test_subtract(self):
        """Test that values are subtracted and returned"""
        self.assertEqual(calc.subtract(6,11), 5)