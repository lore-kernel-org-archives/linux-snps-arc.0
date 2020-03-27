Return-Path: <SRS0=+IpF=5M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA44C43331
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 07:01:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1E2A20705
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 07:01:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ux8b+uu2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="UX15Jazq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1E2A20705
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+pdaQ9e4P3A0Ao0LdgoTmY0WH64f8cyWWbk9kXokHno=; b=ux8b+uu2vIYUuRGInrvoJ/n9y
	G3BVzzz3jyHAXhWhgrE99eYs6Szqk5Cgl9ZgkMLfoq/zuDb+e7gk1kLa7qc8yLmtviAfQWIB+V5or
	MB3NVdEGAHEmkXHfGynUXcEf6Mviyi2hs6yaes5SYQ2nbJFGKrQtvjTqK6Xez51mT3VJkHjIQd+Ll
	RPWtg3FFh1yQHKOlJDOqMUiB2mnww1kimI4NulRUYtVAbsCU1rXmrWPCExpB2r+00s3qT30t75vgG
	DCN5nRs7hU7zC5hjQh9MPBn/a2OZ5elF+09G19jnNtzzq7lH4Xi+26HsWz0HUfdV0avlRRaZfCjaT
	CRmeO1imA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHizN-0007kZ-9L; Fri, 27 Mar 2020 07:01:09 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHiz8-0007Vo-MI; Fri, 27 Mar 2020 07:00:56 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48pXnH05D3z9txq3;
 Fri, 27 Mar 2020 08:00:51 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=UX15Jazq; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id RA_-yOiis4rA; Fri, 27 Mar 2020 08:00:50 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48pXnG5XWyz9txq2;
 Fri, 27 Mar 2020 08:00:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585292450; bh=Ws1T27uMA0wfJZIl4CR6AQkUqBHuQiB6haJ0qz+xiIM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UX15Jazq692nKezahgcBWFZADQzoEn5TOJTlYr5XLS/57u6ncysBxqFZPWgQbrlBy
 BLPR/FqnpU+HiqGEHw4aO+Mm3ZF1ZASdmP3rOi0gJGXiZXKXdy6KknGg8FIO+Or9JQ
 qCqJd84lmJi/DNXsbkiMINQjf68WtsGi+npCBrzc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8BDF78B7BC;
 Fri, 27 Mar 2020 08:00:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oH2Pf5pBdxv5; Fri, 27 Mar 2020 08:00:51 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 655658B756;
 Fri, 27 Mar 2020 08:00:49 +0100 (CET)
Subject: Re: [PATCH V2 0/3] mm/debug: Add more arch page table helper tests
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <1585027375-9997-1-git-send-email-anshuman.khandual@arm.com>
 <2bb4badc-2b7a-e15d-a99b-b1bd38c9d9bf@arm.com>
 <a46d18ed-8911-1ec3-c32f-58b6e0d959d7@c-s.fr>
 <9675882f-0ec5-5e46-551f-dd3aa38bf8d8@arm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <ef28cb75-40b8-5ab5-83ba-84fd4384c7c5@c-s.fr>
Date: Fri, 27 Mar 2020 07:00:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <9675882f-0ec5-5e46-551f-dd3aa38bf8d8@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_000055_035635_15E1605C 
X-CRM114-Status: GOOD (  16.67  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-doc@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpPbiAwMy8yNy8yMDIwIDA2OjQ2IEFNLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToKPiAKPiBP
biAwMy8yNi8yMDIwIDA4OjUzIFBNLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pgo+Pgo+PiBM
ZSAyNi8wMy8yMDIwIMOgIDAzOjIzLCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+Pj4K
Pj4+Cj4+PiBPbiAwMy8yNC8yMDIwIDEwOjUyIEFNLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToK
Pj4+PiBUaGlzIHNlcmllcyBhZGRzIG1vcmUgYXJjaCBwYWdlIHRhYmxlIGhlbHBlciB0ZXN0cy4g
VGhlIG5ldyB0ZXN0cyBoZXJlIGFyZQo+Pj4+IGVpdGhlciByZWxhdGVkIHRvIGNvcmUgbWVtb3J5
IGZ1bmN0aW9ucyBhbmQgYWR2YW5jZWQgYXJjaCBwZ3RhYmxlIGhlbHBlcnMuCj4+Pj4gVGhpcyBh
bHNvIGNyZWF0ZXMgYSBkb2N1bWVudGF0aW9uIGZpbGUgZW5saXN0aW5nIGFsbCBleHBlY3RlZCBz
ZW1hbnRpY3MgYXMKPj4+PiBzdWdnZXN0ZWQgYnkgTWlrZSBSYXBvcG9ydCAoaHR0cHM6Ly9sa21s
Lm9yZy9sa21sLzIwMjAvMS8zMC80MCkuCj4+Pj4KPj4+PiBUaGlzIHNlcmllcyBoYXMgYmVlbiB0
ZXN0ZWQgb24gYXJtNjQgYW5kIHg4NiBwbGF0Zm9ybXMuCj4+Pgo+Pj4gSWYgZm9sa3MgY2FuIHRl
c3QgdGhlc2UgcGF0Y2hlcyBvdXQgb24gcmVtYWluaW5nIEFSQ0hfSEFTX0RFQlVHX1ZNX1BHVEFC
TEUKPj4+IGVuYWJsZWQgcGxhdGZvcm1zIGkuZSBzMzkwLCBhcmMsIHBvd2VycGMgKDMyIGFuZCA2
NCksIHRoYXQgd2lsbCBiZSByZWFsbHkKPj4+IGFwcHJlY2lhdGVkLiBUaGFuayB5b3UuCj4+Pgo+
Pgo+PiBPbiBwb3dlcnBjIDh4eCAoUFBDMzIpLCBJIGdldDoKPj4KPj4gW8KgwqAgNTMuMzM4MzY4
XSBkZWJ1Z192bV9wZ3RhYmxlOiBkZWJ1Z192bV9wZ3RhYmxlOiBWYWxpZGF0aW5nIGFyY2hpdGVj
dHVyZSBwYWdlIHRhYmxlIGhlbHBlcnMKPj4gW8KgwqAgNTMuMzQ3NDAzXSAtLS0tLS0tLS0tLS1b
IGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPj4gW8KgwqAgNTMuMzUxODMyXSBXQVJOSU5HOiBDUFU6
IDAgUElEOiAxIGF0IG1tL2RlYnVnX3ZtX3BndGFibGUuYzo2NDcgZGVidWdfdm1fcGd0YWJsZSsw
eDI4MC8weDNmNAo+IAo+IG1tL2RlYnVnX3ZtX3BndGFibGUuYzo2NDcgPwo+IAo+IFdpdGggdGhl
IGZvbGxvd2luZyBjb21taXRzIGluIHBsYWNlCj4gCj4gNTNhODMzOGNlIChIRUFEKSBEb2N1bWVu
dGF0aW9uL21tOiBBZGQgZGVzY3JpcHRpb25zIGZvciBhcmNoIHBhZ2UgdGFibGUgaGVscGVyCj4g
NWQ0OTEzZmMxIG1tL2RlYnVnOiBBZGQgdGVzdHMgdmFsaWRhdGluZyBhcmNoIGFkdmFuY2VkIHBh
Z2UgdGFibGUgaGVscGVycwo+IGJjYWYxMjBhNyBtbS9kZWJ1ZzogQWRkIHRlc3RzIHZhbGlkYXRp
bmcgYXJjaCBwYWdlIHRhYmxlIGhlbHBlcnMgZm9yIGNvcmUgZmVhdHVyZXMKPiBkNmVkNWE0YTUg
eDg2L21lbW9yeTogRHJvcCBwdWRfbWtub3RwcmVzZW50KCkKPiAwNzM5ZDFmOGQgbW0vZGVidWc6
IEFkZCB0ZXN0cyB2YWxpZGF0aW5nIGFyY2hpdGVjdHVyZSBwYWdlIHRhYmxlIGhlbHBlcnMKPiAx
NmZiZjc5YjAgKHRhZzogdjUuNi1yYzcpIExpbnV4IDUuNi1yYzcKCkkgaGF2ZToKCmZhY2FhNWVi
NTkwOSAoSEVBRCAtPiBoZWxwZXJzMCkgbW0vZGVidWc6IEFkZCB0ZXN0cyB2YWxpZGF0aW5nIGFy
Y2ggCmFkdmFuY2VkIHBhZ2UgdGFibGUgaGVscGVycwo2Mzg5ZmVkNTE1ZmMgbW0vZGVidWc6IEFk
ZCB0ZXN0cyB2YWxpZGF0aW5nIGFyY2ggcGFnZSB0YWJsZSBoZWxwZXJzIGZvciAKY29yZSBmZWF0
dXJlcwpkYzE0ZWNjOGI5NGUgbW0vZGVidWc6IGFkZCB0ZXN0cyB2YWxpZGF0aW5nIGFyY2hpdGVj
dHVyZSBwYWdlIHRhYmxlIGhlbHBlcnMKYzY2MjQwNzFjMzM4IChvcmlnaW4vbWVyZ2UsIG1lcmdl
KSBBdXRvbWF0aWMgbWVyZ2Ugb2YgYnJhbmNoZXMgJ21hc3RlcicsIAonbmV4dCcgYW5kICdmaXhl
cycgaW50byBtZXJnZQo1OGUwNWM1NTA4ZTYgQXV0b21hdGljIG1lcmdlIG9mIGJyYW5jaGVzICdt
YXN0ZXInLCAnbmV4dCcgYW5kICdmaXhlcycgCmludG8gbWVyZ2UKMWI2NDllMGJjYWU3IChvcmln
aW4vbWFzdGVyLCBvcmlnaW4vSEVBRCkgTWVyZ2UgCmdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9uZXRkZXYvbmV0CgpvcmlnaW4gaXMgaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcG93ZXJwYy9saW51eC5naXQKCkkgY2Fu
J3Qgc2VlIHlvdXIgbGFzdCBwYXRjaCBpbiBwb3dlcnBjIG1haWxpbmcgbGlzdCAKKGh0dHBzOi8v
cGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvbGlzdC8/c2VyaWVzPTE2
NjIzNykKCj4gCj4gbW0vZGVidWdfdm1fcGd0YWJsZS5jOjY0NyBpcyBoZXJlLgoKTGluZSA2NDcg
aXM6CgoJV0FSTl9PTighcHRlX3NhbWUocHRlLCBfX3N3cF9lbnRyeV90b19wdGUoc3dwKSkpOwoK
Cj4gCj4gI2lmZGVmIENPTkZJR19BUkNIX0VOQUJMRV9USFBfTUlHUkFUSU9OCj4gc3RhdGljIHZv
aWQgX19pbml0IHBtZF9zd2FwX3Rlc3RzKHVuc2lnbmVkIGxvbmcgcGZuLCBwZ3Byb3RfdCBwcm90
KQo+IHsKPiAgICAgICAgICBzd3BfZW50cnlfdCBzd3A7Cj4gICAgICAgICAgcG1kX3QgcG1kOyAg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0+IExpbmUgIzY0Nwo+IAo+ICAgICAgICAgIHBt
ZCA9IHBmbl9wbWQocGZuLCBwcm90KTsKPiAgICAgICAgICBzd3AgPSBfX3BtZF90b19zd3BfZW50
cnkocG1kKTsKPiAgICAgICAgICBXQVJOX09OKCFwbWRfc2FtZShwbWQsIF9fc3dwX2VudHJ5X3Rv
X3BtZChzd3ApKSk7Cj4gfQo+ICNlbHNlCj4gc3RhdGljIHZvaWQgX19pbml0IHBtZF9zd2FwX3Rl
c3RzKHVuc2lnbmVkIGxvbmcgcGZuLCBwZ3Byb3RfdCBwcm90KSB7IH0KPiAjZW5kCj4gCj4gRGlk
IEkgbWlzcyBzb21ldGhpbmcgPwo+IAoKWy4uLl0KCj4gQ291bGQgeW91IHBsZWFzZSBwb2ludCBt
ZSB0byB0aGUgZXhhY3QgdGVzdCB3aGljaCBpcyBmYWlsaW5nID8KPiAKPj4gW8KgwqAgNTMuNTE5
Nzc4XSBGcmVlaW5nIHVudXNlZCBrZXJuZWwgbWVtb3J5OiA2MDhLCj4+Cj4+Cj4gU28gSSBhc3N1
bWUgdGhhdCB0aGUgc3lzdGVtIHNob3VsZCBoYXZlIGNvbWUgdGlsbCBydW50aW1lIGp1c3QgZmlu
ZSBhcGFydCBmcm9tCj4gdGhlIGFib3ZlIHdhcm5pbmcgbWVzc2FnZSBiZWNhdXNlLgo+IAoKWWVz
IGl0IGJvb3RzIGZpbmUgb3RoZXJ3aXNlLgoKQ2hyaXN0b3BoZQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0
CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
