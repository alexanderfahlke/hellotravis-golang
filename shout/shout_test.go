/*
 *
 * Copyright 2015 Alexander Fahlke
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

package shout

import (
	"github.com/alexanderfahlke/hellotravis-golang/shout"
	"testing"
)

func TestShout(t *testing.T) {
	var msgtests = []struct {
		msgIn  string
		msgOut string
	}{
		{"hello", "hello!"},
		{"Hello Travis-CI", "Hello Travis-CI!"},
	}

	for _, tt := range msgtests {
		s := shout.Shout(tt.msgIn)
		if s != tt.msgOut {
			t.Errorf("shout(%q) => %q, want %q", tt.msgIn, s, tt.msgOut)
		}
	}
}
