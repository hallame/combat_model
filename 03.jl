using Plots
using DifferentialEquations

x0 = 61000
y0 = 45000
t0 = 0
tmax = 1

a = 0.22
b = 0.82
c = 0.45
d = 0.67

a2 = 0.28
b2 = 0.83
c2 = 0.31
d2 = 0.75

function P(t)
    return 2*sin(4*t)
end

function Q(t)
    return 2*cos(4*t)
end

function P2(t)
    return 1.5*sin(t)
end

function Q2(t)
    return 1.5*cos(t)
end

function syst(dy, y, p, t)
    dy[1] = -a*y[1] - b*y[2] + P(t)
    dy[2] = -c*y[1] - d*y[2] + Q(t)
end

function syst2(dy, y, p, t)
    dy[1] = -a2*y[1] - b2*y[2] + P2(t)
    dy[2] = -c2*y[1]*y[2] - d2*y[2] + Q2(t)
end

prob = ODEProblem(syst, [x0; y0], (t0, tmax))
prob2 = ODEProblem(syst2, [x0; y0], (t0, tmax))
t = collect(LinRange(0, 1, 100))
sol = solve(prob, saveat=t)
sol2 = solve(prob2, saveat=t)

plot(sol)
savefig("03.png")

plot(sol2)
savefig("04.png")