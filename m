From: till.smejkal@googlemail.com (Till Smejkal)
Date: Wed, 15 Mar 2017 16:18:43 -0700
Subject: [RFC PATCH 00/13] Introduce first class virtual address spaces
In-Reply-To: <20170315220952.GA1435@intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170315231843.sgxzg6qj34anyirs@arch-dev>
To: linux-snps-arc@lists.infradead.org

On Wed, 15 Mar 2017, Luck, Tony wrote:
> On Wed, Mar 15, 2017@03:02:34PM -0700, Till Smejkal wrote:
> > I don't agree here. VAS segments are basically in-memory files that are handled by
> > the kernel directly without using a file system. Hence, if an application uses a VAS
> > segment to store data the same rules apply as if it uses a file. Everything that it
> > saves in the VAS segment might be accessible by other applications. An application
> > using VAS segments should be aware of this fact. In addition, the resources that are
> > represented by a VAS segment are not leaked. As I said, VAS segments are much like
> > files. Hence, if you don't want to use them any more, delete them. But as with files,
> > the kernel will not delete them for you (although something like this can be added).
> 
> So how do they differ from shmget(2), shmat(2), shmdt(2), shmctl(2)?
> 
> Apart from VAS having better names, instead of silly "key_t key" ones.

Unfortunately, I have to admit that the VAS segments don't differ from shm* a lot.
The implementation is differently, but the functionality that you can achieve with it
is very similar. I am sorry. We should have looked more closely at the whole
functionality that is provided by the shmem subsystem before working on VAS segments.

However, VAS segments are not the key part of this patch set. The more interesting
functionality in our opinion is the introduction of first class virtual address
spaces and what they can be used for. VAS segments were just another logical step for
us (from first class virtual address spaces to first class virtual address space
segments) but since their functionality can be achieved with various other already
existing features of the Linux kernel, I will probably drop them in future versions
of the patchset.

Thanks
Till
