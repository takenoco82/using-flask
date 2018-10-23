import unittest

from parameterized import param, parameterized

from api import app


class TestHello(unittest.TestCase):
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

    @parameterized.expand([
        param("v1", version="v1"),
        param("v2", version="v2"),
    ])
    def test_hello(self, _, version):
        response = self.app.get('/{version}/hello'.format(version=version))

        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.get_data().decode('UTF-8'), "Hello")
