class CounterClicker:
    "[description]"
    def __init__(self, count = 0):
        self.count = count

    def __repr__(self):
        return f'CounterClicker(count={self.count})'

    def click(self, num_times=1):
        self.count += num_times

    def read(self):
        return self.count

    def reset(self):
        self.count = 0


clicker = CounterClicker()
assert clicker.read() == 0, 'licznik powinien zaczynać się od 0'
clicker.click()
clicker.click()
assert clicker.read() == 2, 'licznik powinien wynosić 2'
clicker.reset()
assert clicker.read() == 0, 'licznik powinien zostać zresetowany'
