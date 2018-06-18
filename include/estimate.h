/**
 * Simple estimate data type (just a gloryfied pair)
 *
 * @authors Marco Bacis, Maddalena Beccari
 */

#ifndef STACKSIZE_ESTIMATE_H
#define STACKSIZE_ESTIMATE_H

#include <iostream>
#include <algorithm>

struct estimate_t {

    /**
     * @struct estimate_t
     * @author Marco Bacis
     * @file estimate.h
     * @brief Estimate data type. It's just a gloryfied pair of uints.
     */

    estimate_t() : best(0), worst(0) {}

    estimate_t(unsigned int b,  unsigned int w) : best(b), worst(w) {}

    estimate_t operator+(const estimate_t &o) {
        return {best + o.best, worst + o.worst};
    }

    estimate_t operator+=(const estimate_t &l) {
        best += l.best;
        worst += l.worst;
        return *this;
    }

    estimate_t operator-(const estimate_t &o) {
        return {best - o.best, worst - o.worst};
    }

    estimate_t operator-=(const estimate_t &l) {
        best -= l.best;
        worst -= l.worst;
        return *this;
    }

    unsigned int best;
    unsigned int worst;

};

static estimate_t max(estimate_t &l, estimate_t &r) {
    return {std::max(l.best, r.best), std::max(l.worst,r.worst)};
}

#endif //STACKSIZE_ESTIMATE_H
