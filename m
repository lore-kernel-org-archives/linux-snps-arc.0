Return-Path: <SRS0=73lZ=AI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F377C433DF
	for <linux-snps-arc@archiver.kernel.org>; Sat, 27 Jun 2020 08:18:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D7CC2080C
	for <linux-snps-arc@archiver.kernel.org>; Sat, 27 Jun 2020 08:18:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l81aKgBD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D7CC2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r2zlkGn0rtlWgEJGQCaYGFzz2lgloU+SvrYWArlTcsU=; b=l81aKgBDewL1kAMxYjVE0cbTJ
	b3IXwyeVgoBiJNoEGboGSn2fEXaUwyHGcAAduJuOo0TML59LQp42blReTuSMQiWYralPEMii29SP6
	/dAjmXdAOlVsgeaZXhuJ/38NImySA2Fym9h8WmBTwMTe86JjkX/sVysXl6qFXmBNLh6NSUMm9ul+I
	oZQqBZ55aWImksvcsbCyGIjjfvil3D5DUR42UbRIoMgEkcvxRZ5KygsM/bVTRnz2ckwUUoKAhfi6q
	1SY+nM+OdLAnfE7K3OMEInw3dLtVfo9axBl3hdrU9dUxoxutbUEvTPOm0S+ewqJ313+C7VD9NEGTx
	4fcClDQig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp62C-0006sr-Du; Sat, 27 Jun 2020 08:18:00 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jp626-0006rY-9N; Sat, 27 Jun 2020 08:17:55 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49v67c3vRsz9tyVp;
 Sat, 27 Jun 2020 10:17:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id LVJHe2PffxRU; Sat, 27 Jun 2020 10:17:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49v67c2nSlz9tyVn;
 Sat, 27 Jun 2020 10:17:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ACB498B772;
 Sat, 27 Jun 2020 10:17:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id i_8AMg20BFyg; Sat, 27 Jun 2020 10:17:49 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C3F508B75B;
 Sat, 27 Jun 2020 10:17:47 +0200 (CEST)
Subject: Re: [PATCH V3 0/4] mm/debug_vm_pgtable: Add some more tests
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <1592192277-8421-1-git-send-email-anshuman.khandual@arm.com>
 <70ddc7dd-b688-b73e-642a-6363178c8cdd@arm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <0ed75013-6ac4-3902-391a-1f7152510c6d@csgroup.eu>
Date: Sat, 27 Jun 2020 10:17:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <70ddc7dd-b688-b73e-642a-6363178c8cdd@arm.com>
Content-Language: fr
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
 linux-arm-kernel@lists.infradead.org, ziy@nvidia.com,
 Catalin Marinas <catalin.marinas@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, gerald.schaefer@de.ibm.com,
 christophe.leroy@c-s.fr, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpMZSAyNC8wNi8yMDIwIMOgIDA1OjEzLCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+
IAo+IAo+IE9uIDA2LzE1LzIwMjAgMDk6MDcgQU0sIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+
PiBUaGlzIHNlcmllcyBhZGRzIHNvbWUgbW9yZSBhcmNoIHBhZ2UgdGFibGUgaGVscGVyIHZhbGlk
YXRpb24gdGVzdHMgd2hpY2gKPj4gYXJlIHJlbGF0ZWQgdG8gY29yZSBhbmQgYWR2YW5jZWQgbWVt
b3J5IGZ1bmN0aW9ucy4gVGhpcyBhbHNvIGNyZWF0ZXMgYQo+PiBkb2N1bWVudGF0aW9uLCBlbmxp
c3RpbmcgZXhwZWN0ZWQgc2VtYW50aWNzIGZvciBhbGwgcGFnZSB0YWJsZSBoZWxwZXJzIGFzCj4+
IHN1Z2dlc3RlZCBieSBNaWtlIFJhcG9wb3J0IHByZXZpb3VzbHkgKGh0dHBzOi8vbGttbC5vcmcv
bGttbC8yMDIwLzEvMzAvNDApLgo+Pgo+PiBUaGVyZSBhcmUgbWFueSBUUkFOU1BBUkVOVF9IVUdF
UEFHRSBhbmQgQVJDSF9IQVNfVFJBTlNQQVJFTlRfSFVHRVBBR0VfUFVECj4+IGlmZGVmcyBzY2F0
dGVyZWQgYWNyb3NzIHRoZSB0ZXN0LiBCdXQgY29uc29saWRhdGluZyBhbGwgdGhlIGZhbGxiYWNr
IHN0dWJzCj4+IGlzIG5vdCB2ZXJ5IHN0cmFpZ2h0IGZvcndhcmQgYmVjYXVzZSBBUkNIX0hBU19U
UkFOU1BBUkVOVF9IVUdFUEFHRV9QVUQgaXMKPj4gbm90IGV4cGxpY2l0bHkgZGVwZW5kZW50IG9u
IEFSQ0hfSEFTX1RSQU5TUEFSRU5UX0hVR0VQQUdFLgo+Pgo+PiBUZXN0ZWQgb24gYXJtNjQsIHg4
NiBwbGF0Zm9ybXMgYnV0IG9ubHkgYnVpbGQgdGVzdGVkIG9uIGFsbCBvdGhlciBlbmFibGVkCj4+
IHBsYXRmb3JtcyB0aHJvdWdoIEFSQ0hfSEFTX0RFQlVHX1ZNX1BHVEFCTEUgaS5lIHBvd2VycGMs
IGFyYywgczM5MC4gVGhlCj4+IGZvbGxvd2luZyBmYWlsdXJlIG9uIGFybTY0IHN0aWxsIGV4aXN0
cyB3aGljaCB3YXMgbWVudGlvbmVkIHByZXZpb3VzbHkuIEl0Cj4+IHdpbGwgYmUgZml4ZWQgd2l0
aCB0aGUgdXBjb21pbmcgVEhQIG1pZ3JhdGlvbiBvbiBhcm02NCBlbmFibGVtZW50IHNlcmllcy4K
Pj4KPj4gV0FSTklORyAuLi4uIG1tL2RlYnVnX3ZtX3BndGFibGUuYzo4NjAgZGVidWdfdm1fcGd0
YWJsZSsweDk0MC8weGE1NAo+PiBXQVJOX09OKCFwbWRfcHJlc2VudChwbWRfbWtpbnZhbGlkKHBt
ZF9ta2h1Z2UocG1kKSkpKQo+Pgo+PiBUaGlzIHNlcmllcyBpcyBiYXNlZCBvbiB2NS44LXJjMS4K
Pj4KPj4gQ2hhbmdlcyBpbiBWMzoKPj4KPj4gLSBSZXBsYWNlZCBIQVZFX0FSQ0hfU09GVF9ESVJU
WSB3aXRoIE1FTV9TT0ZUX0RJUlRZCj4+IC0gQWRkZWQgSEFWRV9BUkNIX0hVR0VfVk1BUCBjaGVj
a3MgaW4gcHh4X2h1Z2VfdGVzdHMoKSBwZXIgR2VyYWxkCj4+IC0gVXBkYXRlZCBkb2N1bWVudGF0
aW9uIGZvciBwbWRfdGhwX3Rlc3RzKCkgcGVyIFppIFlhbgo+PiAtIFJlcGxhY2VkIFJFQURfT05D
RSgpIHdpdGggaHVnZV9wdGVwX2dldCgpIHBlciBHZXJhbGQKPj4gLSBBZGRlZCBwdGVfbWtodWdl
KCkgYW5kIG1hc2tpbmcgd2l0aCBQTURfTUFTSyBwZXIgR2VyYWxkCj4+IC0gUmVwbGFjZWQgcHRl
X3NhbWUoKSB3aXRoIGhvbGRpbmcgcGZuIGNoZWNrIGluIHB4eF9zd2FwX3Rlc3RzKCkKPj4gLSBB
ZGRlZCBkb2N1bWVudGF0aW9uIGZvciBhbGwgKCNpZmRlZiAjZWxzZSAjZW5kaWYpIHBlciBHZXJh
bGQKPj4gLSBVcGRhdGVkIHBtZF9wcm90bm9uZV90ZXN0cygpIHBlciBHZXJhbGQKPj4gLSBVcGRh
dGVkIEh1Z2VUTEIgUFRFIGNyZWF0aW9uIGluIGh1Z2V0bGJfYWR2YW5jZWRfdGVzdHMoKSBwZXIg
R2VyYWxkCj4+IC0gUmVwbGFjZWQgW3BtZHxwdWRdX21rbm90cHJlc2VudCgpIHdpdGggW3BtZHxw
dWRdX21raW52YWxpZCgpCj4+IC0gQWRkZWQgaGFzX3RyYW5zcGFyZW50X2h1Z2VwYWdlKCkgY2hl
Y2sgZm9yIFBNRCBhbmQgUFVEIHRlc3RzCj4+IC0gQWRkZWQgYSBwYXRjaCB3aGljaCBkZWJ1ZyBw
cmludHMgYWxsIGluZGl2aWR1YWwgdGVzdHMgYmVpbmcgZXhlY3V0ZWQKPj4gLSBVcGRhdGVkIGRv
Y3VtZW50YXRpb24gZm9yIHJlbmFtZWQgW3BtZHxwdWRdX21raW52YWxpZCgpIGhlbHBlcnMKPiAK
PiBIZWxsbyBHZXJhbGQvQ2hyaXN0b3BoZS9WaW5lZXQsCj4gCj4gSXQgd291bGQgYmUgcmVhbGx5
IGdyZWF0IGlmIHlvdSBjb3VsZCBnaXZlIHRoaXMgc2VyaWVzIGEgcXVpY2sgdGVzdAo+IG9uIHMz
OTAvcHBjL2FyYyBwbGF0Zm9ybXMgcmVzcGVjdGl2ZWx5LiBUaGFuayB5b3UuCj4gCgpSdW5uaW5n
IG9rIG9uIHBvd2VycGMgOHh4IGFmdGVyIGZpeGluZyBidWlsZCBmYWlsdXJlcy4KCkNocmlzdG9w
aGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1h
cmMK
