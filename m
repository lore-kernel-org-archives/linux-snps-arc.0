From: dalias@libc.org (Rich Felker)
Date: Fri, 30 Mar 2018 09:33:48 -0400
Subject: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
In-Reply-To: <20180330075508.GA21798@amd>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180330075508.GA21798@amd>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180330133348.GR1436@brightrain.aerifal.cx>
To: linux-snps-arc@lists.infradead.org

On Fri, Mar 30, 2018@09:55:08AM +0200, Pavel Machek wrote:
> Hi!
> 
> > Current implementation doesn't randomize address returned by mmap.
> > All the entropy ends with choosing mmap_base_addr at the process
> > creation. After that mmap build very predictable layout of address
> > space. It allows to bypass ASLR in many cases. This patch make
> > randomization of address on any mmap call.
> 
> How will this interact with people debugging their application, and
> getting different behaviours based on memory layout?
> 
> strace, strace again, get different results?

Normally gdb disables ASLR for the process when invoking a program to
debug. I don't see why that would be terribly useful with strace but
you can do the same if you want.

Rich
