import unittest
# import configparser
# import json

import testdocker
from testdocker import (
    DockerTestMixin,
    ContainerTestMixin,
    CurlCommand,
    NetCatCommand,
    CatCommand,
)


class TestContainer(ContainerTestMixin, unittest.TestCase):
    """Test <project> container.

    Attributes:
        name:
            (str) Name for container.
        tear_down:
            (bool) Should ``docker-compose down`` be run in ``tearDownClass?``.
        test_patterns:
            (list) Regex patterns to assert in  container logs.
        test_tcp_ports:
            (list) TCP Ports to assert are open
        test_upd_ports:
            (list) TCP Ports to assert are open
        test_http_uris:
            (list) HTTP URI's to test are reachable
    """
    name = ''
    tear_down = False
    test_patterns = [
        r"",
        r"",
        r"",
        r"",
        r"",
    ]
    test_tcp_ports = []
    test_upd_ports = []
    test_http_uris = [
        'http://',
        'http://',
        'http://',
    ]

    def test_correct_<>_in_<>(self):
        """Assert correct  in """
        cmd = ''
        exit_code, output = self.container.exec(cmd)
        self.assertEqual(exit_code, 0)
        self.assertRegex(output, r'')

    def test_correct_<>_in_<>_json_matches_<>_in_env(self):
        """Assert correct  in  json matches  in environment"""
        cmd = 'cat <>.ini'
        exit_code, output = self.container.exec(cmd)
        self.assertEqual(exit_code, 0)

        data = json.loads(output)
        self.assertEqual(
            data.get(''),
            self.container.env['<PROJECT>_VAR']
        )

    def test_correct_<>_in_<>_ini_matches_<>_in_env(self):
        """Assert correct  in  matches  in environment"""
        cmd = 'cat <>.ini'
        exit_code, output = self.container.exec(cmd)
        self.assertEqual(exit_code, 0)

        parser = configparser.ConfigParser(strict=False)
        parser.read_string(output)
        self.assertEqual(
            parser.get('<section>', '<>'),
            self.container.env['<PROJECT>_VAR']
        )

if __name__ == '__main__':
    testdocker.main()
