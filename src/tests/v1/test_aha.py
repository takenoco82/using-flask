import unittest

from api import app


class TestAha(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        pass

    @classmethod
    def tearDownClass(cls):
        pass

    def setUp(self):
        self.app = app.test_client()

    def tearDown(self):
        pass

    def test_aha(self):
        response = self.app.get('/{version}/aha'.format(version="v1"))

        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.get_data().decode('UTF-8'), "aha")
