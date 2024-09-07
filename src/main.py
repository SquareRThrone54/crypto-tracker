import click

@click.group()
def cryptoTracker():
    """A simple CLI to track cryptocurrencies"""
    pass

@cryptoTracker.command()
@click.argument('coin')
def track(coin):
    """Track a specific coin"""
    click.echo(f"Tracking {coin}")

if __name__ == '__main__':
    cryptoTracker()