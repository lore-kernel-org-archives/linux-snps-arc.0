Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1A7C77B7A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 13 Jun 2023 10:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kBuAqU7enAYXkdLitkLq1fNt7QIE0Ro88JzDlTMVUl4=; b=jcYqqtmnlk1dX/
	WVJJYSG3dCtK2Rn0BO7gFTSdVh08Tf5tLpUb3+luEsckPqlDFe+GeQcFVIed7NMnxpP1BFA6j7Ehi
	hq6eKzfEx+Qvo46HILaqx2MOVvv/FndiZ7jjJUoxmxy+NhxMzlL/gqQ72Msp1KAHxUcdryYEcGGHT
	HAXopJDftmafYpW+59r2PXKpigrgbua0bzp9vOf+3ms/m8jEi04hvM9AONFXbG3P0I7ZdsrlqiL4L
	6ZHy/zpOfySOQpKOV574FG7ZnwToNzgfO2hKglrwhJS4e/bWmFU5XoPoBEq2oYKbAtfYPWlIeFifZ
	mNrVg0vFFKspp4oM8wpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q91NY-007fex-2D;
	Tue, 13 Jun 2023 10:36:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q91NV-007fe6-0b
	for linux-snps-arc@lists.infradead.org;
	Tue, 13 Jun 2023 10:35:59 +0000
Received: from [192.168.10.54] (unknown [119.155.33.163])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F391660000E;
	Tue, 13 Jun 2023 11:35:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686652555;
	bh=HbdSMphLp1/aGNarPBMTAmoMfCdZYDwXjyzqGZPOGtA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=eCbyTU2BUbopMEp0/l014XJDWH7zLmxfwh6N+IuQqSPT8pAD5HNik18UCjw7Dsc7G
	 /vqmj4fttKTO0BVCwJiqnn48/01nNX5aJ0czU9q13HY6d5YgAECt/27yeFOtmBpd5+
	 1cpwi9XnJK3ImYUXPXD7oHwevazumaZiK+213l1QbvXH3obGgIQcOM8NZ+b6+7nVDX
	 nRzqIZebJjG/SqbTFdtsx9sGMAlu6nQlFv73gbfOQKnr0k8dXPJ3QIrX4IWQdOrzEQ
	 /Y962W7NI2pvyTejjNeSukWiaANvS0kljQtCv2nU/ewwoBDQK0Q3Wtevvf6mii2biX
	 uqIW8Jt3z6Rcg==
Message-ID: <0e6b318a-bbf8-3701-00af-1802c6347897@collabora.com>
Date: Tue, 13 Jun 2023 15:35:44 +0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
 oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Christian Brauner <brauner@kernel.org>, Yang Shi <shy828301@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Yun Zhou <yun.zhou@windriver.com>,
 Suren Baghdasaryan <surenb@google.com>, Alex Sierra <alex.sierra@amd.com>,
 Matthew Wilcox <willy@infradead.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Axel Rasmussen <axelrasmussen@google.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Greg KH <greg@kroah.com>, kernel test robot <lkp@intel.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WC?=
 =?UTF-8?Q?aw?= <emmir@google.com>, Andrei Vagin <avagin@gmail.com>,
 Danylo Mocherniuk <mdanylo@google.com>, Paul Gofman
 <pgofman@codeweavers.com>, Cyrill Gorcunov <gorcunov@gmail.com>,
 Mike Rapoport <rppt@kernel.org>, Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH v12 2/5] fs/proc/task_mmu: Implement IOCTL to get and
 optionally clear info about PTEs
Content-Language: en-US
To: Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <emmir@google.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
References: <20230406074005.1784728-3-usama.anjum@collabora.com>
 <202304061914.N1Hmx12N-lkp@intel.com>
 <e3c82373-256a-6297-bcb4-5e1179a2cbe2@collabora.com>
 <9d8b5b8e-47c9-16dd-050a-45d917d73c07@collabora.com>
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <9d8b5b8e-47c9-16dd-050a-45d917d73c07@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_033557_475933_DC136935 
X-CRM114-Status: GOOD (  15.85  )
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

SGkgVmluZWV0LAoKSXQgc2VlbXMgYXJjIGFyY2hpdGVjdHVyZSBzdXBwb3J0cyBDT05GSUdfVFJB
TlNQQVJFTlRfSFVHRVBBR0UsIGJ1dCBpdApkb2Vzbid0IGRlZmluZSBIUEFHRV9TSVpFLiBJdCBv
bmx5IGRlZmluZXMgUEFHRV9TSVpFIGluCmluY2x1ZGUvdWFwaS9hc20vcGFnZS5oPyBBRkFJSyBI
UEFHRV9TSVpFIG11c3QgYmUgZGVmaW5lZCB3aGVuCkNPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFH
RSBpcyBlbmFibGVkLiBXaGF0IGNhbiBiZSB0aGUgc29sdXRpb24gaGVyZSBmb3IgYXJjPwoKU2hv
dWxkIEkganVzdCBjb21waWxlIG91dCB0aGlzIGNvZGUgZm9yIGFyYyBhcmNoaXRlY3R1cmUgc3Bl
Y2lmaWNhbGx5PwoKVGhhbmtzLApVc2FtYQoKCk9uIDYvNy8yMyAxMDo0NeKAr0FNLCBNdWhhbW1h
ZCBVc2FtYSBBbmp1bSB3cm90ZToKPiBPbiA0LzYvMjMgNTo1NuKAr1BNLCBNdWhhbW1hZCBVc2Ft
YSBBbmp1bSB3cm90ZToKPj4gT24gNC82LzIzIDQ6NDDigK9QTSwga2VybmVsIHRlc3Qgcm9ib3Qg
d3JvdGU6Cj4+PiBIaSBNdWhhbW1hZCwKPj4+Cj4+PiBrZXJuZWwgdGVzdCByb2JvdCBub3RpY2Vk
IHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3JzOgo+Pj4KPj4+IFthdXRvIGJ1aWxkIHRlc3QgRVJS
T1Igb24gYWtwbS1tbS9tbS1ldmVyeXRoaW5nXQo+Pj4gW2Fsc28gYnVpbGQgdGVzdCBFUlJPUiBv
biBuZXh0LTIwMjMwNDA2XQo+Pj4gW2Nhbm5vdCBhcHBseSB0byBsaW51cy9tYXN0ZXIgdjYuMy1y
YzVdCj4+PiBbSWYgeW91ciBwYXRjaCBpcyBhcHBsaWVkIHRvIHRoZSB3cm9uZyBnaXQgdHJlZSwg
a2luZGx5IGRyb3AgdXMgYSBub3RlLgo+Pj4gQW5kIHdoZW4gc3VibWl0dGluZyBwYXRjaCwgd2Ug
c3VnZ2VzdCB0byB1c2UgJy0tYmFzZScgYXMgZG9jdW1lbnRlZCBpbgo+Pj4gaHR0cHM6Ly9naXQt
c2NtLmNvbS9kb2NzL2dpdC1mb3JtYXQtcGF0Y2gjX2Jhc2VfdHJlZV9pbmZvcm1hdGlvbl0KPj4+
Cj4+PiB1cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC1sYWItbGtwL2xpbnV4L2NvbW1p
dHMvTXVoYW1tYWQtVXNhbWEtQW5qdW0vdXNlcmZhdWx0ZmQtVUZGRF9GRUFUVVJFX1dQX0FTWU5D
LzIwMjMwNDA2LTE1NDMxNAo+Pj4gYmFzZTogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9ha3BtL21tLmdpdCBtbS1ldmVyeXRoaW5nCj4+PiBwYXRjaCBs
aW5rOiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMwNDA2MDc0MDA1LjE3ODQ3Mjgt
My11c2FtYS5hbmp1bSU0MGNvbGxhYm9yYS5jb20KPj4+IHBhdGNoIHN1YmplY3Q6IFtQQVRDSCB2
MTIgMi81XSBmcy9wcm9jL3Rhc2tfbW11OiBJbXBsZW1lbnQgSU9DVEwgdG8gZ2V0IGFuZCBvcHRp
b25hbGx5IGNsZWFyIGluZm8gYWJvdXQgUFRFcwo+Pj4gY29uZmlnOiBhcmMtcmFuZGNvbmZpZy1y
MDIzLTIwMjMwNDA1IChodHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAy
MzA0MDYvMjAyMzA0MDYxOTE0Lk4xSG14MTJOLWxrcEBpbnRlbC5jb20vY29uZmlnKQo+Pj4gY29t
cGlsZXI6IGFyY2ViLWVsZi1nY2MgKEdDQykgMTIuMS4wCj4+PiByZXByb2R1Y2UgKHRoaXMgaXMg
YSBXPTEgYnVpbGQpOgo+Pj4gICAgICAgICB3Z2V0IGh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250
ZW50LmNvbS9pbnRlbC9sa3AtdGVzdHMvbWFzdGVyL3NiaW4vbWFrZS5jcm9zcyAtTyB+L2Jpbi9t
YWtlLmNyb3NzCj4+PiAgICAgICAgIGNobW9kICt4IH4vYmluL21ha2UuY3Jvc3MKPj4+ICAgICAg
ICAgIyBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwtbGFiLWxrcC9saW51eC9jb21taXQvZjEzYWJi
MzZmNjRjNzc5MTM1MDlkYThjYTE1NzUxMmQyZmI5ZjAzMQo+Pj4gICAgICAgICBnaXQgcmVtb3Rl
IGFkZCBsaW51eC1yZXZpZXcgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsLWxhYi1sa3AvbGludXgK
Pj4+ICAgICAgICAgZ2l0IGZldGNoIC0tbm8tdGFncyBsaW51eC1yZXZpZXcgTXVoYW1tYWQtVXNh
bWEtQW5qdW0vdXNlcmZhdWx0ZmQtVUZGRF9GRUFUVVJFX1dQX0FTWU5DLzIwMjMwNDA2LTE1NDMx
NAo+Pj4gICAgICAgICBnaXQgY2hlY2tvdXQgZjEzYWJiMzZmNjRjNzc5MTM1MDlkYThjYTE1NzUx
MmQyZmI5ZjAzMQo+Pj4gICAgICAgICAjIHNhdmUgdGhlIGNvbmZpZyBmaWxlCj4+PiAgICAgICAg
IG1rZGlyIGJ1aWxkX2RpciAmJiBjcCBjb25maWcgYnVpbGRfZGlyLy5jb25maWcKPj4+ICAgICAg
ICAgQ09NUElMRVJfSU5TVEFMTF9QQVRIPSRIT01FLzBkYXkgQ09NUElMRVI9Z2NjLTEyLjEuMCBt
YWtlLmNyb3NzIFc9MSBPPWJ1aWxkX2RpciBBUkNIPWFyYyBvbGRkZWZjb25maWcKPj4+ICAgICAg
ICAgQ09NUElMRVJfSU5TVEFMTF9QQVRIPSRIT01FLzBkYXkgQ09NUElMRVI9Z2NjLTEyLjEuMCBt
YWtlLmNyb3NzIFc9MSBPPWJ1aWxkX2RpciBBUkNIPWFyYyBTSEVMTD0vYmluL2Jhc2ggZnMvcHJv
Yy8KPj4+Cj4+PiBJZiB5b3UgZml4IHRoZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFn
IHdoZXJlIGFwcGxpY2FibGUKPj4+IHwgUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxs
a3BAaW50ZWwuY29tPgo+Pj4gfCBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVp
bGQtYWxsLzIwMjMwNDA2MTkxNC5OMUhteDEyTi1sa3BAaW50ZWwuY29tLwo+Pj4KPj4+IEFsbCBl
cnJvci93YXJuaW5ncyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4pOgo+Pj4KPj4+ICAgIGZzL3By
b2MvdGFza19tbXUuYzogSW4gZnVuY3Rpb24gJ3BhZ2VtYXBfc2Nhbl9wbWRfZW50cnknOgo+Pj4+
PiBmcy9wcm9jL3Rhc2tfbW11LmM6MTkyMTozNzogZXJyb3I6ICdIUEFHRV9TSVpFJyB1bmRlY2xh
cmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiAnUEFHRV9TSVpF
Jz8KPj4+ICAgICAxOTIxIHwgICAgICAgICAgICAgICAgICAgICAoKGVuZCAtIHN0YXJ0IDwgSFBB
R0VfU0laRSkgfHwKPj4+ICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fn5+fgo+Pj4gICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBQQUdFX1NJWkUKPj4gSXQgc2VlbXMgYXJjIGFyY2hpdGVjdHVyZSBzdXBwb3J0
cyBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UsIGJ1dCBpdAo+PiBkb2Vzbid0IGRlZmluZSBI
UEFHRV9TSVpFLiBJdCBvbmx5IGRlZmluZXMgUEFHRV9TSVpFIGluCj4+IGluY2x1ZGUvdWFwaS9h
c20vcGFnZS5oPyBBRkFJSyBIUEFHRV9TSVpFIG11c3QgYmUgZGVmaW5lZCB3aGVuCj4+IENPTkZJ
R19UUkFOU1BBUkVOVF9IVUdFUEFHRSBpcyBlbmFibGVkLiBXaGF0IGNhbiBiZSB0aGUgc29sdXRp
b24gaGVyZSBmb3IgYXJjPwo+IEknbSBzdGlsbCBsb29raW5nIGZvciBzb2x1dGlvbi4gVmluZWV0
IGRvIHlvdSBoYXZlIHNvbWUgdGhvdWdodHM/Cj4gCj4+Cj4+IFRoZSByZW1haW5pbmcgYnVpbGQg
ZmFpbHVyZXMgYXJlIGJlY2F1c2UgdGhlIHdyb25nIHRyZWUuIEkgYmFzZSBteSBwYXRjaGVzCj4+
IG9uIGxhdGVzdCBuZXh0LCB3aGlsZSB0aGUgYm90IGhhcyBiYXNlZCBwYXRjaGVzIG9uIG1tLWV2
ZXJ5dGhpbmcuIEkgZ3Vlc3MKPj4gdG9kYXkncyBuZXh0IHdvdWxkIGhhdmUgbGF0ZXN0IG1tIHN0
dWZmLCBhIHJlYmFzZSB3b3VsZCBtYWtlIHRoaW5ncyBjb3JyZWN0Cj4+IG9yIEknbGwgc2hpZnQg
dG8gbW0tZXZlcnl0aGluZy4KPj4KPj4KPiAKCi0tIApCUiwKTXVoYW1tYWQgVXNhbWEgQW5qdW0K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNu
cHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
