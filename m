From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 21 Nov 2017 14:08:03 -0800
Subject: glibc: nptl/tst-cancel17 and librt issue
In-Reply-To: <878tezguh3.fsf@linux-m68k.org>
References: <af0c5b39-eadb-e70e-2ad3-79754b04b324@synopsys.com>
 <878tezguh3.fsf@linux-m68k.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <97f30016-ab6d-46aa-030b-4f69c7aa4892@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/21/2017 02:03 PM, Andreas Schwab wrote:
> On Nov 21 2017, Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
> 
>> make subdirs=nptl check fails as librt.so fails to link due to missing
>> pthread symbols. The real librt built does have libpthread.so in its link
>> cmd hence is fine, but not this librt.
> 
> Don't do that then.  If you want to take shortcuts you need to know what
> you are doing.  Before running make check you should make all to have
> everything up-to-date.

The problem is not specific subdirs=nptl, it happens for vanilla make check too. I 
was just doing subdirs to save time and find/fix all the errors in one go.

Does anyone know how the make build rules are carved up for this specific case ?

-Vineet
