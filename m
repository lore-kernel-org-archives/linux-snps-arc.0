Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51B9CFC28A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2024 11:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iTnknAi9QyWCfCIOqXDYBcomcG6XT5bJl3OFYhRALtA=; b=egFa0z9jZ5dJx2
	3+xIeraFjexSRlKJjlfuFP72LbRI87U1XLzrzVMfRULkBgDcWnHTXG7LkFxkq8Kekx2s8BeIwjKRp
	Xqt5G2xjXzL487Tz9BwmAUeKsaVbZOYzvgRF9Plh8dAp3we4ZMDuZnRKMRXO+JAwopzS94IxKUDya
	JS0/tkaGPlY4j6BExDa1otsjPTDOuDU/y1+VYzTm9tY6s6K3xJmPcyuLOlEc3G64WJd6T49mYDahe
	RRpG6DZ/UxauCEmz5PTFRItnxyG8L65r7QnWsppvL3kQtq5EscMFPZXQkprTP4WYoqf5KoWEJ60yC
	wZShNIGaHBpQfiq4+T/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0fdC-000000080Q1-1B2V;
	Tue, 15 Oct 2024 11:22:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0fXM-00000007zBw-3w9q;
	Tue, 15 Oct 2024 11:16:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB00E1007;
	Tue, 15 Oct 2024 04:16:53 -0700 (PDT)
Received: from [10.57.86.207] (unknown [10.57.86.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 613183F51B;
	Tue, 15 Oct 2024 04:16:14 -0700 (PDT)
Message-ID: <c04323d5-6dcd-4391-81bb-94ee580ae98f@arm.com>
Date: Tue, 15 Oct 2024 12:16:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 01/57] mm: Add macros ahead of supporting boot-time
 page size selection
Content-Language: en-GB
To: Pingfan Liu <piliu@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Chris Zankel <chris@zankel.net>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Marsden <greg.marsden@oracle.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Ivan Ivanov <ivan.ivanov@suse.com>, Johannes Berg
 <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonas Bonn <jonas@southpole.se>, Kalesh Singh <kaleshsingh@google.com>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <mbrugger@suse.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Miroslav Benes <mbenes@suse.cz>, Rich Felker <dalias@libc.org>,
 Richard Weinberger <richard@nod.at>, Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <20241014105912.3207374-1-ryan.roberts@arm.com> <Zw0iegwMp5ZVGypy@fedora>
 <9b7e4f65-a171-4574-bd53-580e79527fbc@arm.com>
 <CAF+s44QbdPBN-8EcPiWiZgYgZY4v8RK-wA0VEaVXbfnc9_HQ9Q@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAF+s44QbdPBN-8EcPiWiZgYgZY4v8RK-wA0VEaVXbfnc9_HQ9Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_041625_092334_7FDD9BDA 
X-CRM114-Status: GOOD (  32.56  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gMTUvMTAvMjAyNCAwNDowNCwgUGluZ2ZhbiBMaXUgd3JvdGU6Cj4gT24gTW9uLCBPY3QgMTQs
IDIwMjQgYXQgMTA6MDfigK9QTSBSeWFuIFJvYmVydHMgPHJ5YW4ucm9iZXJ0c0Bhcm0uY29tPiB3
cm90ZToKPj4KPj4gT24gMTQvMTAvMjAyNCAxNDo1NCwgUGluZ2ZhbiBMaXUgd3JvdGU6Cj4+PiBI
ZWxsbyBSeWFuLAo+Pj4KPj4+IE9uIE1vbiwgT2N0IDE0LCAyMDI0IGF0IDExOjU4OjA4QU0gKzAx
MDAsIFJ5YW4gUm9iZXJ0cyB3cm90ZToKPj4+PiBhcm02NCBjYW4gc3VwcG9ydCBtdWx0aXBsZSBi
YXNlIHBhZ2Ugc2l6ZXMuIEluc3RlYWQgb2Ygc2VsZWN0aW5nIGEgcGFnZQo+Pj4+IHNpemUgYXQg
Y29tcGlsZSB0aW1lLCBhcyBpcyBkb25lIHRvZGF5LCB3ZSB3aWxsIG1ha2UgaXQgcG9zc2libGUg
dG8KPj4+PiBzZWxlY3QgdGhlIGRlc2lyZWQgcGFnZSBzaXplIG9uIHRoZSBjb21tYW5kIGxpbmUu
Cj4+Pj4KPj4+PiBJbiB0aGlzIGNhc2UgUEFHRV9TSElGVCBhbmQgaXQncyBkZXJpdmF0aXZlcywg
UEFHRV9TSVpFIGFuZCBQQUdFX01BU0sKPj4+PiAoYXMgd2VsbCBhcyBhIG51bWJlciBvZiBvdGhl
ciBtYWNyb3MgcmVsYXRlZCB0byBvciBkZXJpdmVkIGZyb20KPj4+PiBQQUdFX1NISUZULCBidXQg
SSdtIG5vdCB3b3JyeWluZyBhYm91dCB0aG9zZSB5ZXQpLCBhcmUgbm8gbG9uZ2VyCj4+Pj4gY29t
cGlsZS10aW1lIGNvbnN0YW50cy4gU28gdGhlIGNvZGUgYmFzZSBuZWVkcyB0byBjb3BlIHdpdGgg
dGhhdC4KPj4+Pgo+Pj4+IEFzIGEgZmlyc3Qgc3RlcCwgaW50cm9kdWNlIE1JTiBhbmQgTUFYIHZh
cmlhbnRzIG9mIHRoZXNlIG1hY3Jvcywgd2hpY2gKPj4+PiBleHByZXNzIHRoZSByYW5nZSBvZiBw
b3NzaWJsZSBwYWdlIHNpemVzLiBUaGVzZSBhcmUgYWx3YXlzIGNvbXBpbGUtdGltZQo+Pj4+IGNv
bnN0YW50cyBhbmQgY2FuIGJlIHVzZWQgaW4gbWFueSBwbGFjZXMgd2hlcmUgUEFHRV9bU0hJRlR8
U0laRXxNQVNLXQo+Pj4+IHdlcmUgcHJldmlvdXNseSB1c2VkIHdoZXJlIGEgY29tcGlsZS10aW1l
IGNvbnN0YW50IGlzIHJlcXVpcmVkLgo+Pj4+IChTdWJzZXF1ZW50IHBhdGNoZXMgd2lsbCBkbyB0
aGF0IGNvbnZlcnNpb24gd29yaykuIFdoZW4gdGhlIGFyY2gvYnVpbGQKPj4+PiBkb2Vzbid0IHN1
cHBvcnQgYm9vdC10aW1lIHBhZ2Ugc2l6ZSBzZWxlY3Rpb24sIHRoZSBNSU4gYW5kIE1BWCB2YXJp
YW50cwo+Pj4+IGFyZSBlcXVhbCBhbmQgZXZlcnl0aGluZyByZXNvbHZlcyBhcyBpdCBkaWQgcHJl
dmlvdXNseS4KPj4+Pgo+Pj4KPj4+IE1JTiBhbmQgTUFYIGFwcGVhciB0byBjb25zdHJ1Y3QgYSBi
b3VuZGFyeSwgYnV0IGl0IG1heSBiZSBub3QgZW5vdWdoLgo+Pj4gUGxlYXNlIHNlZSB0aGUgZm9s
bG93aW5nIGNvbW1lbnQgaW5saW5lLgo+Pj4KPj4+PiBBZGRpdGlvbmFsbHksIGludHJvZHVjZSBE
RUZJTkVfR0xPQkFMX1BBR0VfU0laRV9WQVJbX0NPTlNUXSgpIHdoaWNoIHdyYXAKPj4+PiBnbG9i
YWwgdmFyaWFibGUgZGVmaW50aW9ucyBzbyB0aGF0IGZvciBib290LXRpbWUgcGFnZSBzaXplIHNl
bGVjdGlvbgo+Pj4+IGJ1aWxkcywgdGhlIHZhcmlhYmxlIGJlaW5nIHdyYXBwZWQgaXMgaW5pdGlh
bGl6ZWQgYXQgYm9vdC10aW1lLCBpbnN0ZWFkCj4+Pj4gb2YgY29tcGlsZS10aW1lLiBUaGlzIGlz
IGRvbmUgYnkgZGVmaW5pbmcgYSBmdW5jdGlvbiB0byBkbyB0aGUKPj4+PiBhc3NpZ25tZW50LCB3
aGljaCBoYXMgdGhlICJjb25zdHJ1Y3RvciIgYXR0cmlidXRlLiBDb25zdHJ1Y3RvciBpcwo+Pj4+
IHByZWZlcnJlZCBvdmVyIGluaXRjYWxsLCBiZWNhdXNlIHdoZW4gY29tcGlsaW5nIGEgbW9kdWxl
LCB0aGUgbW9kdWxlIGlzCj4+Pj4gbGltaXRlZCB0byBhIHNpbmdsZSBpbml0Y2FsbCBidXQgY29u
c3RydWN0b3JzIGFyZSB1bmxpbWl0ZWQuIEZvcgo+Pj4+IGJ1aWx0LWluIGNvZGUsIGNvbnN0cnVj
dG9ycyBhcmUgbm93IGNhbGxlZCBlYXJsaWVyIHRvIGd1YXJyYW50ZWUgdGhhdAo+Pj4+IHRoZSB2
YXJpYWJsZXMgYXJlIGluaXRpYWxpemVkIGJ5IHRoZSB0aW1lIHRoZXkgYXJlIHVzZWQuIEFueSBh
cmNoIHRoYXQKPj4+PiB3YW50cyB0byBlbmFibGUgYm9vdC10aW1lIHBhZ2Ugc2l6ZSBzZWxlY3Rp
b24gd2lsbCBuZWVkIHRvIHNlbGVjdAo+Pj4+IENPTkZJR19DT05TVFJVQ1RPUlMuCj4+Pj4KPj4+
PiBUaGVzZSBuZXcgbWFjcm9zIG5lZWQgdG8gYmUgYXZhaWxhYmxlIGFueXdoZXJlIFBBR0VfU0hJ
RlQgYW5kIGZyaWVuZHMKPj4+PiBhcmUgYXZhaWxhYmxlLiBUaG9zZSBhcmUgZGVmaW5lZCB2aWEg
YXNtL3BhZ2UuaCAoYWx0aG91Z2ggc29tZSBhcmNoZXMKPj4+PiBoYXZlIGEgc3ViLWluY2x1ZGUg
dGhhdCBkZWZpbmVzIHRoZW0pLiBVbmZvcnR1bmF0ZWx5IHRoZXJlIGlzIG5vCj4+Pj4gcmVsaWFi
bGUgYXNtLWdlbmVyaWMgaGVhZGVyIHdlIGNhbiBlYXNpbHkgcGlnZ3ktYmFjayBvbiwgc28gbGV0
J3MgZGVmaW5lCj4+Pj4gYSBuZXcgb25lLCBwZ3RhYmxlLWdlb21ldHJ5LmgsIHdoaWNoIHdlIGlu
Y2x1ZGUgbmVhciB3aGVyZSBlYWNoIGFyY2gKPj4+PiBkZWZpbmVzIFBBR0VfU0hJRlQuIFVnaC4K
Pj4+Pgo+Pj4+IC0tLS0tLS0KPj4+Pgo+Pj4+IE1vc3Qgb2YgdGhlIHByb2JsZW1zIHRoYXQgbmVl
ZCB0byBiZSBzb2x2ZWQgb3ZlciB0aGUgbmV4dCBmZXcgcGF0Y2hlcwo+Pj4+IGZhbGwgaW50byB0
aGVzZSBicm9hZCBjYXRlZ29yaWVzLCB3aGljaCBhcmUgYWxsIHNvbHZlZCB3aXRoIHRoZSBoZWxw
IG9mCj4+Pj4gdGhlc2UgbmV3IG1hY3JvczoKPj4+Pgo+Pj4+IDEuIEFzc2lnbm1lbnQgb2YgdmFs
dWVzIGRlcml2ZWQgZnJvbSBQQUdFX1NJWkUgaW4gZ2xvYmFsIHZhcmlhYmxlcwo+Pj4+Cj4+Pj4g
ICBGb3IgYm9vdC10aW1lIHBhZ2Ugc2l6ZSBidWlsZHMsIHdlIG11c3QgZGVmZXIgdGhlIGluaXRp
YWxpemF0aW9uIG9mCj4+Pj4gICB0aGVzZSB2YXJpYWJsZXMgdW50aWwgYm9vdC10aW1lLCB3aGVu
IHRoZSBwYWdlIHNpemUgaXMga25vd24uIFNlZQo+Pj4+ICAgREVGSU5FX0dMT0JBTF9QQUdFX1NJ
WkVfVkFSW19DT05TVF0oKSBhcyBkZXNjcmliZWQgYWJvdmUuCj4+Pj4KPj4+PiAyLiBEZWZpbmUg
c3RhdGljIHN0b3JhZ2UgaW4gdW5pdHMgcmVsYXRlZCB0byBQQUdFX1NJWkUKPj4+Pgo+Pj4+ICAg
VGhpcyBzdGF0aWMgc3RvcmFnZSB3aWxsIGJlIGRlZmluZWQgYWNjb3JkaW5nIHRvIFBBR0VfU0la
RV9NQVguCj4+Pj4KPj4+PiAzLiBEZWZpbmUgc2l6ZSBvZiBzdHJ1Y3Qgc28gdGhhdCBpdCBpcyBy
ZWxhdGVkIHRvIFBBR0VfU0laRQo+Pj4+Cj4+Pj4gICBUaGUgc3RydWN0IG9mdGVuIGNvbnRhaW5z
IGFuIGFycmF5IHRoYXQgaXMgc2l6ZWQgdG8gZmlsbCB0aGUgcGFnZS4gSW4KPj4+PiAgIHRoaXMg
Y2FzZSwgdXNlIGEgZmxleGlibGUgYXJyYXkgd2l0aCBkeW5hbWljIGFsbG9jYXRpb24uIEluIG90
aGVyCj4+Pj4gICBjYXNlcywgdGhlIHN0cnVjdCBmaXRzIGV4YWN0bHkgb3ZlciBhIHBhZ2UsIHdo
aWNoIGlzIGEgaGVhZGVyIChlLmcuCj4+Pj4gICBzd2FwIGZpbGUgaGVhZGVyKS4gSW4gdGhpcyBj
YXNlLCByZW1vdmUgdGhlIHBhZGRpbmcsIGFuZCBtYW51YWxseQo+Pj4+ICAgZGV0ZXJtaW5lIHRo
ZSBzdHJ1Y3QgcG9pbnRlciB3aXRoaW4gdGhlIHBhZ2UuCj4+Pj4KPj4+Cj4+PiBBYm91dCB0d28g
eWVhcnMgYWdvLCBJIHRyaWVkIHRvIGRvIHNpbWlsYXIgdGhpbmcgaW4geW91ciBzZXJpZXMsIGJ1
dCByYW4KPj4+IGludG8gcHJvYmxlbSBhdCB0aGlzIHBvaW50LCBvciBtYXliZSBub3QgZXhhY3Rs
eSBhcyB0aGUgcG9pbnQgeW91IGxpc3QKPj4+IGhlcmUuIEkgY29uc2lkZXIgdGhpcyBhcyB0aGUg
bW9zdCBjaGFsbGVuZ2VkIHBhcnQuCj4+Pgo+Pj4gVGhlIHNjZW5hcmlvIGlzCj4+PiBzdHJ1Y3Qg
WCB7Cj4+PiAgICAgICBhW3NpemVfYV07Cj4+PiAgICAgICBiW3NpemVfYl07Cj4+PiAgICAgICBj
Owo+Pj4gfTsKPj4+Cj4+PiBXaGVyZSBzaXplX2EgPSBmKFBBR0VfU0hJRlQpLCBzaXplX2I9ZyhQ
QUdFX1NISUZUKS4gT25lIG9mIGYoKSBhbmQgZygpCj4+PiBpcyBwcm9wb3J0aW9uYWwgdG8gUEFH
RV9TSElGVCwgdGhlIG90aGVyIGlzIGludmVyc2VseSBwcm9wb3J0aW9uYWwuCj4+Pgo+Pj4gSG93
IGNhbiB5b3UgZml4IHRoZSByZWZlcmVuY2Ugb2YgWC5hIGFuZCBYLmI/Cj4+Cj4+IElmIHlvdSBu
ZWVkIHRvIGFsbG9jYXRlIHN0YXRpYyBtZW1vcnksIHRoZW4gaW4gdGhpcyBzY2VuYXJpbywgYXNz
dW1pbmcgZigpIGlzCj4+IHByb3BvcnRpb25hbCBhbmQgZygpIGlzIGludmVyc2VseS1wcm9wb3J0
aW9uYWwsIHRoZW4gSSBndWVzcyB5b3UgbmVlZAo+PiBzaXplX2E9ZihQQUdFX1NJWkVfTUFYKSBh
bmQgc2l6ZV9iPWcoUEFHRV9TSVpFX01JTikuIE9yIGlmIHlvdSBjYW4gYWxsb2NhdGUgdGhlCj4g
Cj4gTXkgcG9pbnQgaXMgdGhhdCBzdWNoIHN0dWZmIGNhbiBub3QgYmUgaGFuZGxlZCBieSBzY3Jp
cHRzCj4gYXV0b21hdGljYWxseSBhbmQgbmVlZHMgbWFudWFsIGludGVydmVudGlvbi4KClllcyBh
Z3JlZWQuIEkgc3BlbnQgc29tZSB0aW1lIHRoaW5raW5nIGFib3V0IGhvdyBtdWNoIG9mIHRoaXMg
Y291bGQgYmUgYXV0b21hdGVkCihpLmUuIHdpdGggQ29jaGluZWxsZSBvciBvdGhlcndpc2UpLCBi
dXQgY29uY2x1ZGVkIHRoYXQgaXQncyB2ZXJ5IGRpZmZpY3VsdC4gQXMKYSByZXN1bHQsIGFsbCBv
ZiB0aGUgcGF0Y2hlcyBpbiB0aGlzIHNlcmllcyBhcmUgbWFudWFsbHkgY3JlYXRlZC4KCj4gCj4+
IG1lbW9yeSBkeW5hbWljYWxseSwgdGhlbiBtYWtlIGEgYW5kIGIgcG9pbnRlcnMgdG8gZHluYW1p
Y2FsbHkgYWxsb2NhdGVkIGJ1ZmZlcnMuCj4+Cj4gCj4gVGhpcyBzZWVtcyBhIGJldHRlciB3YXkg
b3V0Lgo+IAo+PiBJcyB0aGVyZSBhIHNwZWNpZmljIHBsYWNlIGluIHRoZSBzb3VyY2Ugd2hlcmUg
dGhpcyBwYXR0ZXJuIGlzIHVzZWQgdG9kYXk/IEl0Cj4+IG1pZ2h0IGJlIGVhc2llciB0byBkaXNj
dXNzIGluIHRoZSBjb250ZXh0IG9mIHRoZSBjb2RlIGlmIHNvLgo+Pgo+IAo+IE5vIHN1Y2ggY29k
ZSBhdCBoYW5kLiBKdXN0IHRocm93IG91dCB0aGUgcG90ZW50aWFsIGlzc3VlIGFuZCBiZQo+IGN1
cmlvdXMgYWJvdXQgaXQgd2hpY2ggZnJ1c3RyYXRlcyBtZS4KPiBJIGhvcGUgcGVvcGxlIGNhbiBy
ZWFjaCBhbiBhZ3JlZW1lbnQgb24gaXQgYW5kIHR1cm4gdGhpcyB1c2VmdWwgc2VyaWVzCj4gaW50
byByZWFsaXR5LgoKWWVzLCBob3BlIHNvIQoKPiAKPiBUaGFua3MsCj4gCj4gUGluZ2Zhbgo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNu
cHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
