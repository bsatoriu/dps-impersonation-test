import logging

LOGGER = logging.getLogger(__name__)
LOGGER.setLevel(logging.DEBUG)
logFormatter = logging.Formatter('%(asctime)s - %(module)s.%(name)s:%(lineno)d - %(levelname)s - %(message)s')
fileHandler = logging.FileHandler("dps_unit_test.log")
fileHandler.setFormatter(logFormatter)
LOGGER.addHandler(fileHandler)

consoleHandler = logging.StreamHandler()
consoleHandler.setFormatter(logFormatter)
LOGGER.addHandler(consoleHandler)


def write_output_file():
    LOGGER.debug("Testing writing file")
    with open("triage_output_test.out", 'w') as fw:
        fw.write("Testing writing to file to persist with triage dataset")


def throw_exception():
    try:
        raise RuntimeError("Throwing RuntimeError Exception")
    except Exception as e:
        LOGGER.exception(e)
        raise e


if __name__ == '__main__':
    LOGGER.info("Starting traige test")
    write_output_file()
    throw_exception()
