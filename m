Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E27C77B7A
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Jun 2023 05:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZ+ebpUVRYchUG/UTY23clYv+N9EXzyd2lCSVtN7N5s=; b=dzMc0R+naS8+iS
	Ph6xj01zD4FOTKF8JqQc9zJAGba1xKueSXKCgrGvx4T1slcGIVO5eqMccTiGfr1FBi+9a90WnIW3D
	la2MZKsJHFS91bC4EQYv6MOp0WKTNMZ3kJhriJM9p6zl0Ek5S95tOrgteGX7v7Eh0bYF9fArLty0x
	/tE//4/QpH8AUhjOdl527ZH5T+dm7i/n/Nbxs/GzptPffn9ITK3PUP4gC9A+/AXhVJFTUnygBBYOn
	yoSqH/rEASi7KYcH7TNmNS0V1/m9ia4CcxVj9BDmqLzBTjipliXQI90qNwqp2m//D0s7RdmY4EFor
	MkHc2TmglWcHeW9qfLvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6lzG-004SxZ-1F;
	Wed, 07 Jun 2023 05:45:38 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6lzC-004Suz-1e
	for linux-snps-arc@lists.infradead.org;
	Wed, 07 Jun 2023 05:45:36 +0000
Received: from [192.168.10.48] (unknown [119.152.150.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 25F176606EEC;
	Wed,  7 Jun 2023 06:45:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686116726;
	bh=v41rsZme1rrV0UDXeZHFRH87LHFl+vrfIF59dWd8644=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Ln2fFhtz2qsFxNskc9DRPGajGdxp019E1vLoMvosoin3RKletQ2orcyC4YuLjdY01
	 JaU4b7GQoLlwbozJ1Pw7BhRChJhPo50bbAELcTyIfidtwcBQI5bSObpoECpaJNvmFv
	 1GN/DP6+j4yf0qwtmBvOl8tu6HNklqehJLGA+VVFtg5QbnukNQ0eYEj1XGJxg2p7AZ
	 eemWiFjsUaVBmknD97DhWLz899nKupk6A28+TQApefSnWZ8BqxCHd1rM9mQ1CpiFmf
	 +wWJxnECNVIIU9y7uSXuESRQqhuRGh72rzTCmti9Ian7gJJtJgNSYasZ25DJK3kZBS
	 bZbwZJONntqCw==
Message-ID: <9d8b5b8e-47c9-16dd-050a-45d917d73c07@collabora.com>
Date: Wed, 7 Jun 2023 10:45:14 +0500
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
To: Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
References: <20230406074005.1784728-3-usama.anjum@collabora.com>
 <202304061914.N1Hmx12N-lkp@intel.com>
 <e3c82373-256a-6297-bcb4-5e1179a2cbe2@collabora.com>
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <e3c82373-256a-6297-bcb4-5e1179a2cbe2@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_224534_805697_3B4C8609 
X-CRM114-Status: GOOD (  18.14  )
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

T24gNC82LzIzIDU6NTbigK9QTSwgTXVoYW1tYWQgVXNhbWEgQW5qdW0gd3JvdGU6Cj4gT24gNC82
LzIzIDQ6NDDigK9QTSwga2VybmVsIHRlc3Qgcm9ib3Qgd3JvdGU6Cj4+IEhpIE11aGFtbWFkLAo+
Pgo+PiBrZXJuZWwgdGVzdCByb2JvdCBub3RpY2VkIHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3Jz
Ogo+Pgo+PiBbYXV0byBidWlsZCB0ZXN0IEVSUk9SIG9uIGFrcG0tbW0vbW0tZXZlcnl0aGluZ10K
Pj4gW2Fsc28gYnVpbGQgdGVzdCBFUlJPUiBvbiBuZXh0LTIwMjMwNDA2XQo+PiBbY2Fubm90IGFw
cGx5IHRvIGxpbnVzL21hc3RlciB2Ni4zLXJjNV0KPj4gW0lmIHlvdXIgcGF0Y2ggaXMgYXBwbGll
ZCB0byB0aGUgd3JvbmcgZ2l0IHRyZWUsIGtpbmRseSBkcm9wIHVzIGEgbm90ZS4KPj4gQW5kIHdo
ZW4gc3VibWl0dGluZyBwYXRjaCwgd2Ugc3VnZ2VzdCB0byB1c2UgJy0tYmFzZScgYXMgZG9jdW1l
bnRlZCBpbgo+PiBodHRwczovL2dpdC1zY20uY29tL2RvY3MvZ2l0LWZvcm1hdC1wYXRjaCNfYmFz
ZV90cmVlX2luZm9ybWF0aW9uXQo+Pgo+PiB1cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRl
bC1sYWItbGtwL2xpbnV4L2NvbW1pdHMvTXVoYW1tYWQtVXNhbWEtQW5qdW0vdXNlcmZhdWx0ZmQt
VUZGRF9GRUFUVVJFX1dQX0FTWU5DLzIwMjMwNDA2LTE1NDMxNAo+PiBiYXNlOiAgIGh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FrcG0vbW0uZ2l0IG1tLWV2
ZXJ5dGhpbmcKPj4gcGF0Y2ggbGluazogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIz
MDQwNjA3NDAwNS4xNzg0NzI4LTMtdXNhbWEuYW5qdW0lNDBjb2xsYWJvcmEuY29tCj4+IHBhdGNo
IHN1YmplY3Q6IFtQQVRDSCB2MTIgMi81XSBmcy9wcm9jL3Rhc2tfbW11OiBJbXBsZW1lbnQgSU9D
VEwgdG8gZ2V0IGFuZCBvcHRpb25hbGx5IGNsZWFyIGluZm8gYWJvdXQgUFRFcwo+PiBjb25maWc6
IGFyYy1yYW5kY29uZmlnLXIwMjMtMjAyMzA0MDUgKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBk
YXktY2kvYXJjaGl2ZS8yMDIzMDQwNi8yMDIzMDQwNjE5MTQuTjFIbXgxMk4tbGtwQGludGVsLmNv
bS9jb25maWcpCj4+IGNvbXBpbGVyOiBhcmNlYi1lbGYtZ2NjIChHQ0MpIDEyLjEuMAo+PiByZXBy
b2R1Y2UgKHRoaXMgaXMgYSBXPTEgYnVpbGQpOgo+PiAgICAgICAgIHdnZXQgaHR0cHM6Ly9yYXcu
Z2l0aHVidXNlcmNvbnRlbnQuY29tL2ludGVsL2xrcC10ZXN0cy9tYXN0ZXIvc2Jpbi9tYWtlLmNy
b3NzIC1PIH4vYmluL21ha2UuY3Jvc3MKPj4gICAgICAgICBjaG1vZCAreCB+L2Jpbi9tYWtlLmNy
b3NzCj4+ICAgICAgICAgIyBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwtbGFiLWxrcC9saW51eC9j
b21taXQvZjEzYWJiMzZmNjRjNzc5MTM1MDlkYThjYTE1NzUxMmQyZmI5ZjAzMQo+PiAgICAgICAg
IGdpdCByZW1vdGUgYWRkIGxpbnV4LXJldmlldyBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwtbGFi
LWxrcC9saW51eAo+PiAgICAgICAgIGdpdCBmZXRjaCAtLW5vLXRhZ3MgbGludXgtcmV2aWV3IE11
aGFtbWFkLVVzYW1hLUFuanVtL3VzZXJmYXVsdGZkLVVGRkRfRkVBVFVSRV9XUF9BU1lOQy8yMDIz
MDQwNi0xNTQzMTQKPj4gICAgICAgICBnaXQgY2hlY2tvdXQgZjEzYWJiMzZmNjRjNzc5MTM1MDlk
YThjYTE1NzUxMmQyZmI5ZjAzMQo+PiAgICAgICAgICMgc2F2ZSB0aGUgY29uZmlnIGZpbGUKPj4g
ICAgICAgICBta2RpciBidWlsZF9kaXIgJiYgY3AgY29uZmlnIGJ1aWxkX2Rpci8uY29uZmlnCj4+
ICAgICAgICAgQ09NUElMRVJfSU5TVEFMTF9QQVRIPSRIT01FLzBkYXkgQ09NUElMRVI9Z2NjLTEy
LjEuMCBtYWtlLmNyb3NzIFc9MSBPPWJ1aWxkX2RpciBBUkNIPWFyYyBvbGRkZWZjb25maWcKPj4g
ICAgICAgICBDT01QSUxFUl9JTlNUQUxMX1BBVEg9JEhPTUUvMGRheSBDT01QSUxFUj1nY2MtMTIu
MS4wIG1ha2UuY3Jvc3MgVz0xIE89YnVpbGRfZGlyIEFSQ0g9YXJjIFNIRUxMPS9iaW4vYmFzaCBm
cy9wcm9jLwo+Pgo+PiBJZiB5b3UgZml4IHRoZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xsb3dpbmcg
dGFnIHdoZXJlIGFwcGxpY2FibGUKPj4gfCBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3Qg
PGxrcEBpbnRlbC5jb20+Cj4+IHwgTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1
aWxkLWFsbC8yMDIzMDQwNjE5MTQuTjFIbXgxMk4tbGtwQGludGVsLmNvbS8KPj4KPj4gQWxsIGVy
cm9yL3dhcm5pbmdzIChuZXcgb25lcyBwcmVmaXhlZCBieSA+Pik6Cj4+Cj4+ICAgIGZzL3Byb2Mv
dGFza19tbXUuYzogSW4gZnVuY3Rpb24gJ3BhZ2VtYXBfc2Nhbl9wbWRfZW50cnknOgo+Pj4+IGZz
L3Byb2MvdGFza19tbXUuYzoxOTIxOjM3OiBlcnJvcjogJ0hQQUdFX1NJWkUnIHVuZGVjbGFyZWQg
KGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuICdQQUdFX1NJWkUnPwo+
PiAgICAgMTkyMSB8ICAgICAgICAgICAgICAgICAgICAgKChlbmQgLSBzdGFydCA8IEhQQUdFX1NJ
WkUpIHx8Cj4+ICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xn5+fn5+fn5+fgo+PiAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFBBR0VfU0laRQo+IEl0IHNlZW1zIGFyYyBhcmNoaXRlY3R1cmUgc3VwcG9ydHMgQ09ORklH
X1RSQU5TUEFSRU5UX0hVR0VQQUdFLCBidXQgaXQKPiBkb2Vzbid0IGRlZmluZSBIUEFHRV9TSVpF
LiBJdCBvbmx5IGRlZmluZXMgUEFHRV9TSVpFIGluCj4gaW5jbHVkZS91YXBpL2FzbS9wYWdlLmg/
IEFGQUlLIEhQQUdFX1NJWkUgbXVzdCBiZSBkZWZpbmVkIHdoZW4KPiBDT05GSUdfVFJBTlNQQVJF
TlRfSFVHRVBBR0UgaXMgZW5hYmxlZC4gV2hhdCBjYW4gYmUgdGhlIHNvbHV0aW9uIGhlcmUgZm9y
IGFyYz8KSSdtIHN0aWxsIGxvb2tpbmcgZm9yIHNvbHV0aW9uLiBWaW5lZXQgZG8geW91IGhhdmUg
c29tZSB0aG91Z2h0cz8KCj4gCj4gVGhlIHJlbWFpbmluZyBidWlsZCBmYWlsdXJlcyBhcmUgYmVj
YXVzZSB0aGUgd3JvbmcgdHJlZS4gSSBiYXNlIG15IHBhdGNoZXMKPiBvbiBsYXRlc3QgbmV4dCwg
d2hpbGUgdGhlIGJvdCBoYXMgYmFzZWQgcGF0Y2hlcyBvbiBtbS1ldmVyeXRoaW5nLiBJIGd1ZXNz
Cj4gdG9kYXkncyBuZXh0IHdvdWxkIGhhdmUgbGF0ZXN0IG1tIHN0dWZmLCBhIHJlYmFzZSB3b3Vs
ZCBtYWtlIHRoaW5ncyBjb3JyZWN0Cj4gb3IgSSdsbCBzaGlmdCB0byBtbS1ldmVyeXRoaW5nLgo+
IAo+IAoKLS0gCkJSLApNdWhhbW1hZCBVc2FtYSBBbmp1bQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0Cmxp
bnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
