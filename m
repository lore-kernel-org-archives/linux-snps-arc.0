From: fweimer@redhat.com (Florian Weimer)
Date: Tue, 18 Dec 2018 10:12:19 +0100
Subject: [PATCH] testsuite fix: timezone: failing due to permissions in
 cross testing
In-Reply-To: <alpine.DEB.2.21.1812172322060.9554@digraph.polyomino.org.uk>
 (Joseph Myers's message of "Mon, 17 Dec 2018 23:25:23 +0000")
References: <1545088170-24103-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812172322060.9554@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <87a7l342rw.fsf@oldenburg2.str.redhat.com>
To: linux-snps-arc@lists.infradead.org

* Joseph Myers:

> On Mon, 17 Dec 2018, Vineet Gupta wrote:
>
>> timezone test driver "zic" creates testdata directory wuth umask 755, so
>> only root owner/group has write permissions. However the buildroot
>
> root should not be involved in running tests at all; all tests should run 
> as a normal user, the same one that owns the build directory, and thus all 
> files and directories in the build directory should be owned by that user.
> (Some tests use user namespaces to test functionality that requires root, 
> but that's root inside a namespace, not the real user root.)

There are also some xtests that require root privileges, such as
nptl/tst-setuid1.  Building and testing as root is supported (but
obviously not recommended unless you use a throwaway machine).

Thanks,
Florian
