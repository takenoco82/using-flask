import unittest

import run


class TestWorld(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        pass

    @classmethod
    def tearDownClass(cls):
        pass

    def setUp(self):
        self.app = run.app.test_client()

    def tearDown(self):
        pass

    def test_world(self):
        response = self.app.get('/v2/world')

        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.get_data().decode('UTF-8'), "World!")