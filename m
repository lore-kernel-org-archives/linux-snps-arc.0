Return-Path: <SRS0=N5rj=ZD=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91C5C43331
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Nov 2019 22:53:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 996B020659
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Nov 2019 22:53:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i7P4nyUB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 996B020659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yzmmGf49QRqyOlcMIYVEEZotp5+OYlyKg2npSoKYkyM=; b=i7P4nyUBTa/ZNx6t6Du0Wdce4
	9wxFpwWweWtG7SNRj5uP4jE6GBXKgdpo8dhliL9cj/06xD0WVpVItpctRrCV54eaXZ6utVnEzGNFS
	nMBM+XjWBdpX9Fsf3vCPERBmmthtICTNiZ/5OM5FxVDe/OAjtinDA6MnbUhE2faYKETvNRhewBeyU
	9QtFCdBsVDvzpJAe9pcSlv6vgqG1mZQu098pVVCXk4EOkq7rHpuZRTF3MeRcNmNpTZp/VEMpTeuO3
	WGnYGfdaviwr7VuHpVEuxuiniDzV2VynFzkZBt3hNNpgHEFmKlsuLmXCar7LC8MgWimin1/DKbB5V
	4Dhoqo2wQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUIYR-0001nY-Hf; Mon, 11 Nov 2019 22:53:03 +0000
Received: from esa1.mentor.iphmx.com ([68.232.129.153])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUIYP-0001nD-0s
 for linux-snps-arc@lists.infradead.org; Mon, 11 Nov 2019 22:53:02 +0000
IronPort-SDR: 41YHEyPZeKCRPMHUpQ7Rrb1l2ANAis8UbYHt+VD3nxB9VQmE0Mhv5vOQ5mLsLIVFvZplgvZAVC
 Gzsz4IqRt3SznoxI2qm2k6dWj3It87L/amT7paxU1EHE2tnomAvly4mzfEQGTPc5mGODvNDtYR
 uR2Zrp+8Hc6fKZwVaomNfWHVsODEFx2cIZ09Z4M/FILzLUbKTXPuZ+MiFzTb+imeMAhkvRuCod
 aqGOaDWttDZ84OaQNmBx4HPeKotmRllL/ovn8lfuxISSgQ7E7ZWQeRjj6eGQvyFCIOVrpPjs6t
 HmY=
X-IronPort-AV: E=Sophos;i="5.68,294,1569312000"; d="scan'208";a="44924494"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa1.mentor.iphmx.com with ESMTP; 11 Nov 2019 14:53:00 -0800
IronPort-SDR: aH5Ei5oUIqB2wVW+LUeq/tB73MoeqzJxmpJOhGuaGjKFHOY+99r9/tm/ylEaoUF7db5Itm6DwV
 gxbZuW3NHQ2U1LqOy5Is2ZpW20ly57W+CI0Z94uFGKmr4xWMWv8KQF0XZlw1SKjip08qS8PVKr
 dyALJDl0F50o6Pgxs8Sywaxom0lRYMajRld7v+FkFlyatonK1JR/OA8IbC5gfmUpRj1n/3lgxH
 pkNj+rc73mwuL6NfTwAOTC87FWLgRwLDWJLIoUFq5H5gwcXPwak9w2uDABYWwOQL6m39uon2RA
 JWA=
Date: Mon, 11 Nov 2019 22:52:55 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH] ieee754/dbl-64: Reduce the scope of temporary storage
 variables
In-Reply-To: <7d22a532-6f19-6b43-2e7a-f6087f658606@synopsys.com>
Message-ID: <alpine.DEB.2.21.1911112247180.30786@digraph.polyomino.org.uk>
References: <20191111194349.21813-1-vgupta@synopsys.com>
 <alpine.DEB.2.21.1911112228550.30786@digraph.polyomino.org.uk>
 <7d22a532-6f19-6b43-2e7a-f6087f658606@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="-1152306461-2128764594-1573512775=:30786"
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-06.mgc.mentorg.com (139.181.222.6) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_145301_068300_A5FAC374 
X-CRM114-Status: GOOD (  12.91  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

---1152306461-2128764594-1573512775=:30786
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT

On Mon, 11 Nov 2019, Vineet Gupta wrote:

> On 11/11/19 2:33 PM, Joseph Myers wrote:
> > On Mon, 11 Nov 2019, Vineet Gupta wrote:
> >
> >> Functionally it should not result in code gen changes and if at all
> >> those would be better since the scope of those temporaries is greatly
> >> reduced now
> > This feels like the sort of thing where "should not result in code gen 
> > changes" should be tested by running build-many-glibcs.py --strip with 
> > unmodified glibc sources to build a full set of stripped glibc binaries, 
> > saving those binaries and then running build-many-glibcs.py --strip again 
> > and comparing the two sets of shared libraries (something I did a lot of 
> > when reworking how libm function aliases were defined; static libraries 
> > are expected to change because of timestamps, but shared library binaries 
> > can be usefully compared like this).  If the two sets of stripped binaries 
> > are indeed identical, that is strong evidence that the patch is safe; 
> > otherwise, review of the patch will require more detailed inspection of 
> > the types of the arguments to these macros, and the uses of the temporary 
> > variables, at every call site, to make sure that semantics aren't being 
> > changed.
> 
> Ok Understand.  What arch(es) / build options would you want this tested for in
> aforementioned way to get a reasonable confidence ?

The suggestion is two full "build-many-glibcs.py --strip <dir> glibcs" 
runs (one before and one after the change, and comparing the resulting 
binaries), covering all architectures, if you have suitable fast hardware 
for doing such testing (it's quite time-consuming; a single run takes 
about 3 hours wall-clock time on a 16-core / 32-hardware-thread 
Haswell-based Xeon, for example).  (A single "compilers" run can be used 
to build the compilers used for both those "glibcs" runs.)

> > (In any case, please specify when submitting a patch how it was tested.)
> 
> I've currently tested this with build-many-glibcs.py for ARC port only with and
> w/o hard float support being worked on.

If for whatever reason there *are* differences in the stripped glibc 
shared libraries, at least one full run of the glibc testsuite (including 
execution tests) for some architecture will be needed as well to verify 
that the generated code works correctly in at least one configuration.

-- 
Joseph S. Myers
joseph@codesourcery.com
---1152306461-2128764594-1573512775=:30786
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

---1152306461-2128764594-1573512775=:30786--

