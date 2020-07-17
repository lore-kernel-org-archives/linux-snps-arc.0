Return-Path: <SRS0=spoa=A4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E5AC433E2
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Jul 2020 03:22:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88DF6207BC
	for <linux-snps-arc@archiver.kernel.org>; Fri, 17 Jul 2020 03:22:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vRoB0FnD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88DF6207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RkLNV9duD6CFCNTLnnhGfNWpZTbiXdCVaBIymjwFo1Q=; b=vRoB0FnD6XxbSfeFMrUWKpjZT
	Vll/+7KzqdGqFpx9cUPAlhbDAWby4hXF/3GtsojxArWXltkmOU4/RMsx3I2xS9Ny7Tmd/fRj+M3Nd
	B3CQnn4bO1ARrSKFT8qUU5FOp1wvPKc+51rNWdGw6l40i8GqnFy9n0v/FsyXSRnDRCcUffRGiUIMb
	NU62z+Z0/Eb2tdAsUekL+gLSfdcFMnwgBg+LpqOvV3N+uZujtOuhEQzQ7VY+kd6QHqLjNC2fgUss3
	WgENyOyFuWfTQpF2BLE15xUf5Ms7MRONe5ZyN/pRcg7VdilVqgJk2CqJvmo0HaZsGXPHq0e1q4Mlq
	KLphHcBYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwGwl-0001cK-EC; Fri, 17 Jul 2020 03:22:03 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwGwh-0001ab-48; Fri, 17 Jul 2020 03:22:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5723DD6E;
 Thu, 16 Jul 2020 20:21:53 -0700 (PDT)
Received: from [192.168.0.129] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0ED73F68F;
 Thu, 16 Jul 2020 20:21:43 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V5 1/4] mm/debug_vm_pgtable: Add tests validating arch
 helpers for core MM features
To: Steven Price <steven.price@arm.com>, linux-mm@kvack.org
References: <1594610587-4172-1-git-send-email-anshuman.khandual@arm.com>
 <1594610587-4172-2-git-send-email-anshuman.khandual@arm.com>
 <2ff756c5-28e2-b64a-3788-260ba30c6409@arm.com>
Message-ID: <efdd0b57-6515-2ee7-a245-a23be6a1d823@arm.com>
Date: Fri, 17 Jul 2020 08:50:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <2ff756c5-28e2-b64a-3788-260ba30c6409@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_232159_255240_8937D113 
X-CRM114-Status: GOOD (  20.04  )
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, agordeev@linux.ibm.com,
 Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 christophe.leroy@csgroup.eu, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 gerald.schaefer@de.ibm.com, ziy@nvidia.com,
 Catalin Marinas <catalin.marinas@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>, cai@lca.pw,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 christophe.leroy@c-s.fr, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 aneesh.kumar@linux.ibm.com, Borislav Petkov <bp@alien8.de>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 rppt@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpPbiAwNy8xNi8yMDIwIDA3OjQ0IFBNLCBTdGV2ZW4gUHJpY2Ugd3JvdGU6Cj4gT24gMTMvMDcv
MjAyMCAwNDoyMywgQW5zaHVtYW4gS2hhbmR1YWwgd3JvdGU6Cj4+IFRoaXMgYWRkcyBuZXcgdGVz
dHMgdmFsaWRhdGluZyBhcmNoIHBhZ2UgdGFibGUgaGVscGVycyBmb3IgdGhlc2UgZm9sbG93aW5n
Cj4+IGNvcmUgbWVtb3J5IGZlYXR1cmVzLiBUaGVzZSB0ZXN0cyBjcmVhdGUgYW5kIHRlc3Qgc3Bl
Y2lmaWMgbWFwcGluZyB0eXBlcyBhdAo+PiB2YXJpb3VzIHBhZ2UgdGFibGUgbGV2ZWxzLgo+Pgo+
PiAxLiBTUEVDSUFMIG1hcHBpbmcKPj4gMi4gUFJPVE5PTkUgbWFwcGluZwo+PiAzLiBERVZNQVAg
bWFwcGluZwo+PiA0LiBTT0ZURElSVFkgbWFwcGluZwo+PiA1LiBTV0FQIG1hcHBpbmcKPj4gNi4g
TUlHUkFUSU9OIG1hcHBpbmcKPj4gNy4gSFVHRVRMQiBtYXBwaW5nCj4+IDguIFRIUCBtYXBwaW5n
Cj4+Cj4+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+PiBD
YzogR2VyYWxkIFNjaGFlZmVyIDxnZXJhbGQuc2NoYWVmZXJAZGUuaWJtLmNvbT4KPj4gQ2M6IENo
cmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAYy1zLmZyPgo+PiBDYzogTWlrZSBSYXBv
cG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+PiBDYzogVmluZWV0IEd1cHRhIDx2Z3VwdGFAc3lu
b3BzeXMuY29tPgo+PiBDYzogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNv
bT4KPj4gQ2M6IFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+Cj4+IENjOiBCZW5qYW1pbiBI
ZXJyZW5zY2htaWR0IDxiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+Cj4+IENjOiBQYXVsIE1hY2tl
cnJhcyA8cGF1bHVzQHNhbWJhLm9yZz4KPj4gQ2M6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxl
cm1hbi5pZC5hdT4KPj4gQ2M6IEhlaWtvIENhcnN0ZW5zIDxoZWlrby5jYXJzdGVuc0BkZS5pYm0u
Y29tPgo+PiBDYzogVmFzaWx5IEdvcmJpayA8Z29yQGxpbnV4LmlibS5jb20+Cj4+IENjOiBDaHJp
c3RpYW4gQm9ybnRyYWVnZXIgPGJvcm50cmFlZ2VyQGRlLmlibS5jb20+Cj4+IENjOiBUaG9tYXMg
R2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPj4gQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0By
ZWRoYXQuY29tPgo+PiBDYzogQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+Cj4+IENjOiAi
SC4gUGV0ZXIgQW52aW4iIDxocGFAenl0b3IuY29tPgo+PiBDYzogS2lyaWxsIEEuIFNodXRlbW92
IDxraXJpbGxAc2h1dGVtb3YubmFtZT4KPj4gQ2M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNs
ZXlAc2lmaXZlLmNvbT4KPj4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+
Cj4+IENjOiBsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4+IENjOiBsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gQ2M6IGxpbnV4cHBjLWRldkBsaXN0cy5v
emxhYnMub3JnCj4+IENjOiBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9yZwo+PiBDYzogbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBDYzogeDg2QGtlcm5lbC5vcmcKPj4gQ2M6IGxp
bnV4LW1tQGt2YWNrLm9yZwo+PiBDYzogbGludXgtYXJjaEB2Z2VyLmtlcm5lbC5vcmcKPj4gQ2M6
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPj4gVGVzdGVkLWJ5OiBWaW5lZXQgR3VwdGEg
PHZndXB0YUBzeW5vcHN5cy5jb20+wqDCoMKgICNhcmMKPj4gUmV2aWV3ZWQtYnk6IFppIFlhbiA8
eml5QG52aWRpYS5jb20+Cj4+IFN1Z2dlc3RlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGlu
Lm1hcmluYXNAYXJtLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogQW5zaHVtYW4gS2hhbmR1YWwgPGFu
c2h1bWFuLmtoYW5kdWFsQGFybS5jb20+Cj4+IC0tLQo+PiDCoCBtbS9kZWJ1Z192bV9wZ3RhYmxl
LmMgfCAzMDIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4+IMKg
IDEgZmlsZSBjaGFuZ2VkLCAzMDEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvbW0vZGVidWdfdm1fcGd0YWJsZS5jIGIvbW0vZGVidWdfdm1fcGd0YWJsZS5j
Cj4+IGluZGV4IDYxYWIxNmZiMmUzNi4uMmZhYzQ3ZGIzZWI3IDEwMDY0NAo+PiAtLS0gYS9tbS9k
ZWJ1Z192bV9wZ3RhYmxlLmMKPj4gKysrIGIvbW0vZGVidWdfdm1fcGd0YWJsZS5jCj4gWy4uLl0K
Pj4gKwo+PiArc3RhdGljIHZvaWQgX19pbml0IHB0ZV9zd2FwX3Rlc3RzKHVuc2lnbmVkIGxvbmcg
cGZuLCBwZ3Byb3RfdCBwcm90KQo+PiArewo+PiArwqDCoMKgIHN3cF9lbnRyeV90IHN3cDsKPj4g
K8KgwqDCoCBwdGVfdCBwdGU7Cj4+ICsKPj4gK8KgwqDCoCBwdGUgPSBwZm5fcHRlKHBmbiwgcHJv
dCk7Cj4+ICvCoMKgwqAgc3dwID0gX19wdGVfdG9fc3dwX2VudHJ5KHB0ZSk7Cj4gCj4gTWlub3Ig
aXNzdWU6IHRoaXMgZG9lc24ndCBsb29rIG5lY2Vzc2FyaWx5IHZhbGlkIC0gdGhlcmUncyBubyBy
ZWFzb24gYSBub3JtYWwgUFRFIGNhbiBiZSB0dXJuZWQgaW50byBhIHN3cF9lbnRyeS4gSW4gcHJh
Y3Rpc2UgdGhpcyBpcyBsaWtlbHkgdG8gd29yayBvbiBhbGwgYXJjaGl0ZWN0dXJlcyBiZWNhdXNl
IHRoZXJlJ3Mgbm8gcmVhc29uIG5vdCB0byB1c2UgKGF0IGxlYXN0KSBhbGwgdGhlIFBGTiBiaXRz
IGZvciB0aGUgc3dhcCBlbnRyeSwgYnV0IGl0IGRvZXNuJ3QgZXhhY3RseSBzZWVtIGNvcnJlY3Qu
CgpBZ3JlZWQsIHRoYXQgaXQgaXMgYSBzaW1wbGUgdGVzdCBidXQgbm9uZXRoZWxlc3MgYSB2YWxp
ZCBvbmUgd2hpY2gKbWFrZXMgc3VyZSB0aGF0IFBGTiB2YWx1ZSByZW1haW5lZCB1bmNoYW5nZWQg
ZHVyaW5nIHB0ZSA8LS0tPiBzd3AKY29udmVyc2lvbi4KCj4gCj4gQ2FuIHdlIHN0YXJ0IHdpdGgg
YSBzd3BfZW50cnlfdCAoZnJvbSBfX3N3cF9lbnRyeSgpKSBhbmQgY2hlY2sgdGhlIHJvdW5kIHRy
aXAgb2YgdGhhdD8KPiAKPiBJdCB3b3VsZCBhbHNvIHNlZW0gc2Vuc2libGUgdG8gaGF2ZSBhIGNo
ZWNrIHRoYXQgaXNfc3dhcF9wdGUoX19zd3BfZW50cnlfdG9fcHRlKF9fc3dwX2VudHJ5KHgseSkp
KSBpcyB0cnVlLgoKRnJvbSBwYXN0IGV4cGVyaWVuY2VzLCBnZXR0aW5nIGFueSB0aGVzZSBuZXcg
dGVzdHMgaW52b2x2aW5nIHBsYXRmb3JtCmhlbHBlcnMsIHdvcmtpbmcgb24gYWxsIGV4aXN0aW5n
IGVuYWJsZWQgYXJjaHMgaXMgbmVpdGhlciB0cml2aWFsIG5vcgpnb2luZyB0byBiZSBxdWljay4g
RXhpc3RpbmcgdGVzdHMgaGVyZSBhcmUga25vd24gdG8gc3VjY2VlZCBpbiBlbmFibGVkCnBsYXRm
b3Jtcy4gTm9uZXRoZWxlc3MsIHByb3Bvc2VkIHRlc3RzIGFzIGluIHRoZSBhYm92ZSBzdWdnZXN0
aW9ucyBkbwptYWtlIHNlbnNlIGJ1dCB3aWxsIHRyeSB0byBhY2NvbW1vZGF0ZSB0aGVtIGluIGEg
bGF0ZXIgcGF0Y2guCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXNucHMtYXJjCg==
