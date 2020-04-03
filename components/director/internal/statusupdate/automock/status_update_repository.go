// Code generated by mockery v1.0.0. DO NOT EDIT.

package automock

import (
	context "context"

	mock "github.com/stretchr/testify/mock"
)

// StatusUpdateRepository is an autogenerated mock type for the StatusUpdateRepository type
type StatusUpdateRepository struct {
	mock.Mock
}

// IsConnected provides a mock function with given fields: ctx, id, table
func (_m *StatusUpdateRepository) IsConnected(ctx context.Context, id string, table string) (bool, error) {
	ret := _m.Called(ctx, id, table)

	var r0 bool
	if rf, ok := ret.Get(0).(func(context.Context, string, string) bool); ok {
		r0 = rf(ctx, id, table)
	} else {
		r0 = ret.Get(0).(bool)
	}

	var r1 error
	if rf, ok := ret.Get(1).(func(context.Context, string, string) error); ok {
		r1 = rf(ctx, id, table)
	} else {
		r1 = ret.Error(1)
	}

	return r0, r1
}

// UpdateStatus provides a mock function with given fields: ctx, id, table
func (_m *StatusUpdateRepository) UpdateStatus(ctx context.Context, id string, table string) error {
	ret := _m.Called(ctx, id, table)

	var r0 error
	if rf, ok := ret.Get(0).(func(context.Context, string, string) error); ok {
		r0 = rf(ctx, id, table)
	} else {
		r0 = ret.Error(0)
	}

	return r0
}
