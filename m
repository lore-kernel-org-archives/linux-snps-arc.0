From: fweimer@redhat.com (Florian Weimer)
Date: Wed, 09 Jan 2019 13:15:06 +0100
Subject: [PATCH] testsuite fix: timezone: failing due to permissions in
 cross testing
In-Reply-To: <alpine.DEB.2.21.1812181716180.2407@digraph.polyomino.org.uk>
 (Joseph Myers's message of "Tue, 18 Dec 2018 17:17:53 +0000")
References: <1545088170-24103-1-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812172322060.9554@digraph.polyomino.org.uk>
 <87a7l342rw.fsf@oldenburg2.str.redhat.com>
 <alpine.DEB.2.21.1812181716180.2407@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <87o98quiwl.fsf@oldenburg2.str.redhat.com>
To: linux-snps-arc@lists.infradead.org

* Joseph Myers:

> On Tue, 18 Dec 2018, Florian Weimer wrote:
>
>> There are also some xtests that require root privileges, such as
>> nptl/tst-setuid1.  Building and testing as root is supported (but
>
> That looks like it ought to become a test using user namespaces (and so 
> not an xtest).

Can an unprivileged user namespace really be used to get a working
setuid?  The setup code in support_become_root/setup_uid_gid_mapping
does not provide that.

Thanks,
Florian
