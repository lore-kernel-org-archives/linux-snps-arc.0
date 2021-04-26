Return-Path: <SRS0=GR/N=JX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4A7C433ED
	for <linux-snps-arc@archiver.kernel.org>; Mon, 26 Apr 2021 16:16:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43D266115C
	for <linux-snps-arc@archiver.kernel.org>; Mon, 26 Apr 2021 16:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43D266115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jJCps/DFy5b6NGyj2//2s3UnUZm04VjZJySa9ddMhfA=; b=OhYp+JLEEbK9gRQWr70MJT3Hm
	fKRrXnnUog558c/2Yq8K0XU9L+nIdgA4Iq2TWnAGqIZRCLKZbFR2VyEZlqRVUwJAQKeMX9/VZ/AML
	S83/e8gRQBKxkjuRlwG6TS01F9mRNMUQrdlm3VKw2zxjysn02qgANIgeHcsFYk/fKm5G+1ck7iaQO
	mrBf/++wAmEkOiY8s09NWlfx57QBr7eEKNCyqsO8NmYI8QvjnK72JoM631DCu/9jFeNctaIeUxRnd
	nzlSJXnwiZc5+1UjfF9UmXa38nYx8vzGMS1FmtQbmRlLXu//S55sREghAcGgIhxL1rfLdjpKroi7q
	ph4fTLNQg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lb3u6-0084Km-Du; Mon, 26 Apr 2021 16:16:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb3u5-0084Kg-3T
 for linux-snps-arc@desiato.infradead.org; Mon, 26 Apr 2021 16:16:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=E0kz0EJfOSMbctgZHIbPrtsz8wCykbYF4ml7+FBNOuY=; b=uFEN2eUIucAXiQ6zvHwb3auSJ+
 kInRSVlCKyOUu4ZURWjBV0cTl+qWnr3zvH2xjvYflO2rtD/f5OcoA2pgqdO13PoftzKTkERyKLc3c
 9pTz8AgaaviiHJFj3jMR4f4+ayun4xzNFUN6XTpjrzYY1HiQ6UVM+O+sh5kTnsrLFzhSVp0/RJh9H
 ocN8Gp+A2pyd4qr7S+XiJk+OkBywShGjD0EGp+i1fIrVn6nklID01B2zMct1QcBA0LA65sty4PN9w
 TtZvQkWuu+m0Ocash3Qe5f1F7NeIE5pNbNT7hqib546oAn1tiHVbKyGBbQtDo9tWjw81OtxKv9QyX
 qt8tg46A==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lb3u2-00G5Ew-7r
 for linux-snps-arc@lists.infradead.org; Mon, 26 Apr 2021 16:16:07 +0000
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QG2uBI170971; Mon, 26 Apr 2021 12:16:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=E0kz0EJfOSMbctgZHIbPrtsz8wCykbYF4ml7+FBNOuY=;
 b=WO80uvnYRYqyv+Q6od0ijlVE5L6kICg88586ylX/pdgSA6W29I8sa0/mwkHcbrlB6ywy
 YjZ4J7pJZkzzbtz9tTf1Ie+QEoMmRjAeBqdRYipvJ/N5ckl934Fn/oH5oo2jQ7lUT1DV
 /C9vXZu+0Gl7pife8m7eSi7YzXdL2cHcrTITIV8yzMPeVPXODDa6bE5n8m1ynIa+fnyi
 crmIwR969sK/WYte6NoLz1FO6w/gBXfP3UD6hMb3Y9EoyNpIguado18CQqF+rPg3eheZ
 J7BlTAOh+xKpulAAxf4Dyhq1RIPbuZverTCVzCY2jkTCBZYVpW9U2aDzJJKXmb89OM14 og== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 385xg15n5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 12:16:03 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13QGEmO5021241;
 Mon, 26 Apr 2021 16:16:02 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 384gjxrf19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 16:16:01 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13QGFwre40239400
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Apr 2021 16:15:58 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B57D942042;
 Mon, 26 Apr 2021 16:15:58 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB22E42041;
 Mon, 26 Apr 2021 16:15:57 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.40.129])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 26 Apr 2021 16:15:57 +0000 (GMT)
Date: Mon, 26 Apr 2021 19:15:55 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Vladimir Isaev <Vladimir.Isaev@synopsys.com>
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARC: Use max_high_pfn as a HIGHMEM zone border
Message-ID: <YIbnO3BhOeUSRU0E@linux.ibm.com>
References: <20210426101004.42695-1-isaev@synopsys.com>
 <YIakBTNpLsPJaj7i@linux.ibm.com>
 <BY5PR12MB41318EB561C2E936B0371B5EDF429@BY5PR12MB4131.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BY5PR12MB41318EB561C2E936B0371B5EDF429@BY5PR12MB4131.namprd12.prod.outlook.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BLF-7QuEMiNJAE9cDSBetA1gurf1Ts6J
X-Proofpoint-ORIG-GUID: BLF-7QuEMiNJAE9cDSBetA1gurf1Ts6J
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-26_08:2021-04-26,
 2021-04-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=887 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104260122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_091606_522529_EBB8F525 
X-CRM114-Status: GOOD (  21.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, Apr 26, 2021 at 11:55:00AM +0000, Vladimir Isaev wrote:
> Hi Mike,
> 
> On Mon, April 26, 2021 2:29 PM, Mike Rapoport wrote:
> > On Mon, Apr 26, 2021 at 01:10:04PM +0300, Vladimir Isaev wrote:
> > > -	max_zone_pfn[ZONE_HIGHMEM] = min_low_pfn;
> > > +	max_zone_pfn[ZONE_HIGHMEM] = max_high_pfn;
> > 
> > This is correct with PAE40, but it will break !PAE40 when "highmem" has lower
> > addresses than lowmem.
> > 
> > It rather should be something like:
> > 
> >         if (IS_ENABLED(CONFIG_ARC_HAS_PAE40))
> >                 max_zone_pfn[ZONE_HIGHMEM] = max_high_pfn;
> >         else
> >             	max_zone_pfn[ZONE_HIGHMEM] = min_low_pfn;
> > 
> 
> Not sure if I understand why we should have min_low_pfn here. In !PAE40
> case max_high_pfn just will be smaller than min_low_pfn.

Hmm, actually, you are right. This should be fine.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
