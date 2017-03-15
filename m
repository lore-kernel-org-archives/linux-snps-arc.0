From: tony.luck@intel.com (Luck, Tony)
Date: Wed, 15 Mar 2017 15:09:53 -0700
Subject: [RFC PATCH 00/13] Introduce first class virtual address spaces
In-Reply-To: <20170315220234.mooiyrzqdsglo4lp@arch-dev>
References: <CALCETrXfGgxaLivhci0VL=wUaWAnBiUXC47P7TUaEuOYV_-X_g@mail.gmail.com>
 <20170315220234.mooiyrzqdsglo4lp@arch-dev>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170315220952.GA1435@intel.com>
To: linux-snps-arc@lists.infradead.org

On Wed, Mar 15, 2017@03:02:34PM -0700, Till Smejkal wrote:
> I don't agree here. VAS segments are basically in-memory files that are handled by
> the kernel directly without using a file system. Hence, if an application uses a VAS
> segment to store data the same rules apply as if it uses a file. Everything that it
> saves in the VAS segment might be accessible by other applications. An application
> using VAS segments should be aware of this fact. In addition, the resources that are
> represented by a VAS segment are not leaked. As I said, VAS segments are much like
> files. Hence, if you don't want to use them any more, delete them. But as with files,
> the kernel will not delete them for you (although something like this can be added).

So how do they differ from shmget(2), shmat(2), shmdt(2), shmctl(2)?

Apart from VAS having better names, instead of silly "key_t key" ones.

-Tony
