Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254BBE7717F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Dec 2024 16:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iTHANGnw/f9dbiN6O8I2lbWwP8sN9KI77DC89CKLXWQ=; b=yCUvzfuKm+exU/
	m1xEBoOGMev4mhu8JOT4bqz2L4t2cn7TdRqDw0h9Jvq37IfW7CmgmQcplHAnPD1vZkhYLbz5hmhTM
	AnpfzkCIePgBkEuEBn1HbQTJJ6BHh/hMdUlPX00jb04keiuez/i8ohBRpXBwOjLLlwEGGFjafkygx
	uTaZOjTsMekKPt6k0UsrdWo9MK7xM21R8y6x3vfKlIq13BHQJzMwIs5rSbq0zD8cdfWSV2ZmLDfNg
	wPULKUM7MtuAdUMzKgBpO9mDYQVZlxYHAxzzFbLtSs/oafNLUa01gidJTdOBh4tdE2tZOUEReMXl0
	eHNPq8f35MVurvlRBJiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8uI-00000004U51-32tb;
	Fri, 13 Dec 2024 16:52:50 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8o4-00000004SCy-0UBv;
	Fri, 13 Dec 2024 16:46:25 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDDk8Ts005941;
	Fri, 13 Dec 2024 16:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=RJ1VqmlJLO3RNdivupzUXoSe73ZDIuhpVXIsQlyHYpg=; b=
	fS+TdS6n9tk/Rpe20RugOeluIcG5L1nPzsp9IJi0ZlpYALr5jky+Tl2s10jWLCoy
	pEjrGfrbhCM/pIfIboAPTIQoRwutIai1bM5lbNid9fQX0ZnwJc9MGPLrkJFSGlPg
	U8B/8MeKAX8kbSH5KMTapmw9NNwpDpQtGHevcHpxx/AZEuRBolnY6V//EmFS/J7G
	DgIyhxZqHxkpT1h+p51XD4zkYCxiCd6xH4dg/T1rqpaVRrOzhLf85az9szbwv65H
	nx5zAhw62uq40Wqg3Lw2kCdHVZiXuRKIKYIrWdZQCfrHhmpK4LfQ0tK1i+0lq+uC
	TuZdQgB8DlbRiHPBgQSh7g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43ddr6bvd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2024 16:45:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDEtmMM035026;
	Fri, 13 Dec 2024 16:45:41 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43cctm730r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Dec 2024 16:45:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWYdS/Rsyi8GKcI/hQyj7pLpZNC879tcTgCTW/S/2NR+TOjUpuKWmLNOZipaQamJOg0SNmZXp3wE5PDe0H3Amx/vqCDiRFbEaDSh3oxKMnis39oECl24s0ZhAvagv73R9eFRH7X5/DeInSLKBjP+vZT9FsvhX6pUMpPd8FWpMEU6783mCL0+uKHmjAfKAqMcRIOwPcsskxrIF4LVYqnpsYBmS7Udzy37GMTOvvF870nY3W14wJqKk9Cc4kmFo+yhsK3GU7E96AogdkpAIVsCmaMAGWCj+LG7i8F9gsxggBApEaJh+NZamwpJ8X6y5chDTxveskI4AjL2ak9MvVUkEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJ1VqmlJLO3RNdivupzUXoSe73ZDIuhpVXIsQlyHYpg=;
 b=fzy++VbgyBmq6BKUepVNm1iAzI6Xrb+zV9GTAE34SrZILd8VMW6obx/IlVvqDu56t7huET3RYBkKVfMyEBAcWaJe7OYFKRmc1gsLDM394cPqg1SfDBBETmMoVDDPb8WzX6IMZnpcT+tlLwg1SANGMFO/rtdW2iAhpi+GEc9GkhnYTfZ/a1hp/befYSgd3Hz79SNETVVPJmcWjz+2queOjQ4R0MfvDZa9HbrRSh8mpeqdd3zbJk4W4jGFKHiZNVZPAaANTGlr8lGF/dtRqWXapCFR1cjEMV9NVs0mhYmNpafEebdeASTucaO9nS5izYVMcGSPZz2tviIkY0bmvQ4Kgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJ1VqmlJLO3RNdivupzUXoSe73ZDIuhpVXIsQlyHYpg=;
 b=NkMYw/27R2yAkm0+s5nT+JAnlBuIJx7fNuV9luxRXEEJfrdtYglDzayTyeWGS0PvQhpbD3QXxCy2RTxh5m2tVMXpWNefmjWjtxQZOT0AZpPCblxTl4OeZqIcqzCQa6+yR+R5zKnRn6hRRX9gjGGtuqlJGL5uo1V8K3QNes4NbJ8=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CH3PR10MB7117.namprd10.prod.outlook.com (2603:10b6:610:126::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 16:45:39 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 16:45:39 +0000
Date: Fri, 13 Dec 2024 11:45:32 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Kalesh Singh <kaleshsingh@google.com>,
        Andrew Morton <akpm@linux-foundation.org>, vbabka@suse.cz,
        yang@os.amperecomputing.com, riel@surriel.com, david@redhat.com,
        minchan@kernel.org, jyescas@google.com, linux@armlinux.org.uk,
        tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
        ysato@users.sourceforge.jp, dalias@libc.org,
        glaubitz@physik.fu-berlin.de, davem@davemloft.net, andreas@gaisler.com,
        tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, chris@zankel.net, jcmvbkbc@gmail.com,
        bhelgaas@google.com, jason.andryuk@amd.com, leitao@debian.org,
        linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-mm@kvack.org,
        kernel-team@android.com, android-mm@google.com,
        Jann Horn <jannh@google.com>
Subject: Re: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
Message-ID: <x2y7rewvmri25wj72qaeuunqqsqj7pqcliahoxkprcbfxg5owv@icvnojkhrdch>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Kalesh Singh <kaleshsingh@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, vbabka@suse.cz, yang@os.amperecomputing.com, riel@surriel.com, 
	david@redhat.com, minchan@kernel.org, jyescas@google.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, jcmvbkbc@gmail.com, 
	bhelgaas@google.com, jason.andryuk@amd.com, leitao@debian.org, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-mm@kvack.org, kernel-team@android.com, android-mm@google.com, 
	Jann Horn <jannh@google.com>
References: <20241211232754.1583023-1-kaleshsingh@google.com>
 <hmuzfspqjzb36xlj2x44keihacrrhzj5madqrfbcnhqouzredv@wo75achgkuh5>
 <1818e2ea-f170-4a9c-8d93-2a24f2755a41@lucifer.local>
 <20241212173609.afd41d1dffbefe0d731ed4ed@linux-foundation.org>
 <695eabb8-ba28-4031-bc4d-66dc4f1d096f@lucifer.local>
 <CAC_TJvcdz854DmBoVRkb_B5j+u-t=4zHkLtHVeB5RJ=bXcBJag@mail.gmail.com>
 <9675c409-b495-46a5-a90c-c952892b4121@lucifer.local>
Content-Disposition: inline
In-Reply-To: <9675c409-b495-46a5-a90c-c952892b4121@lucifer.local>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0248.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::27) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CH3PR10MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bc9aa13-1573-4c81-d927-08dd1b959325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTgrQlRrQk1iZDVzTGFXQ1c0c3BFOVlDYnp3ZEVRU090dVo5bE9XbDFESE1V?=
 =?utf-8?B?V2ZDQ3hGYkNRT3lxMDQycHkzZ3ljRDZEWTkzbzR2OE1aTC9OWXRINTAvRWRW?=
 =?utf-8?B?OXdQWThJYm9tZFNEc0lXaEQ2ZEpnaGtPOVlmeW1wTi8vTkVyQjlPMk5Ra3dj?=
 =?utf-8?B?NzVQdlAwUmRvOGFLb0FVWjJBLzlxMXM1STQxeFcrQUl6bkkzNE1EejBYbE5Z?=
 =?utf-8?B?ZlJaVGs5SlM4QnVqZFNzUHZKbUNnQUsxaThadXpOSFRsa3BxMXlZcHVLV1ND?=
 =?utf-8?B?eFdUS0tzTFZBSXNtZmZkdHpuTys5UHlBWDFydE9KOHg2Z0dNTHd4d0dhOUph?=
 =?utf-8?B?TVJMaElTTmtOdEVQZS82Z2FmUVZxenpLbCtmaEJtR3dCNTlybk53WGRkQllU?=
 =?utf-8?B?NXJEWVBBb2k5T1ZwOExrZGluSjdpK1AySmdhZFVTaEw0VFowMmJWZXQ3YVND?=
 =?utf-8?B?aDMyd3FueHNjb1c2SS9FblVFK3M1OFk2OEQ0aEFOQVlOK0Y3ZTJtMWl3L2N0?=
 =?utf-8?B?eFlQam1XeHkzRUR5T2oyMVF4ZnE1RWVPb1lPSG4yRUorMlJSTENtN0VNemkx?=
 =?utf-8?B?bzVHdjBPYmh5QVlGaVJqbnlPK0VEbGUvUVlzMUgwd1NNSTRwTnROTDZTR1pK?=
 =?utf-8?B?U0xrWC93KzZGZUY5d1c1c2t0V3V6a0VHbWNEMWxIVHE2emJGcHQwOUtHeElH?=
 =?utf-8?B?NVIzNWRhRDBDcTYrT2xRMS9tL0FIYzBNamhkZ1Bpc1N2M2JYYVdPZUpoZ2I1?=
 =?utf-8?B?cGdORmtDc002Tzh0VVk1NVNtVi9GNTZ1SWFITENGc2hVOXFLdk0rbThXYTV1?=
 =?utf-8?B?TTNvN2ZvQ0xjUWRuT3pTdStJaWtYYWRuakNFZVhJcC9FT1hHSkJGTXZQVkR0?=
 =?utf-8?B?Q0NuMElVRGROdjZTSUQvUlBXOEZWSytHZzFNSi9UU3oxdWZUZ1pxZmxCTElq?=
 =?utf-8?B?bndyWGs3UDBXcHV4MzB0dEdGcEpKQ29SNWNtaHR0ZVE4YmVVTTZpaXNja1Y2?=
 =?utf-8?B?Mm52L1oxWmpYVE1LdDhJM0VXYm1aY3B6cXl6ZlpERXFQcTAzb3RVZmEwd1Zq?=
 =?utf-8?B?TDUxMWV2d2loeHIwakxFTmV1eVJ4Q3N0YkN1eWpxVVdHcmVXYU9pZ2d2WVNv?=
 =?utf-8?B?RjNtTGV3QWVCSUlGelU5U0tpOXV4TDRJYTBhWnVkYlBLMTZteVNCalRTQkJG?=
 =?utf-8?B?Mlp3V25BaWxLNi81Q3M4M1AxbHU5TE9iSk54eU9xL2tZZ25HTVUrNUxzSDQz?=
 =?utf-8?B?aTJzbEhpcGFMQWU2R2E0QVFYYzlYVTJwNUdRazYwLzJPK04xOHBGTVlVNmZ5?=
 =?utf-8?B?SjBDSTVXMjhUbUZJcXY4L0dMOG9IZklJOGUxUFZkQ09IWFYvYVlHbFhxanlw?=
 =?utf-8?B?VldBTGFyTE1BZ3I3ekR0Y3pLeS9UWVVyUGUzays5TGhsM2swRHEyMWtHcjdK?=
 =?utf-8?B?M2dSTmVHd0VscXdNbWxGOWZWcS95dTV0bzlydytDM1R0NFJLRUZFMWQvUkQ3?=
 =?utf-8?B?blBJNHZNeFNOQ21sV24zSDZnYnZSMzBnZHFheThEY2U5NXFURzRjTllPT2xU?=
 =?utf-8?B?WnlpNGNhNlh6ZGF0cmVRbWNTdWMwQU9hMVV2UWFPbndTOVorY2VNbk0wL1VS?=
 =?utf-8?B?U2dZRHhEUzJsZXRxUXNkbHhRQ21odFo3WE45ak1GWkhVWk51ZEpnRTU3Z1NK?=
 =?utf-8?B?b3MxMGxnUkRwZmlhZ0drZmlNNkQ3QWdHUFBjdHZaNXRidlVSS1hka0E1eXhj?=
 =?utf-8?B?cENoYjUrWmd4bVhHQlNxZktsbTdGdVJQSTBaTVJ5a2VYdllDMy9MVU42ajZO?=
 =?utf-8?B?ZGdHaXhPb2MySVJ6MDA2NlVRYXJZcXJwOXlBZG1JL0NkSFk0L256Q3l0ZkRT?=
 =?utf-8?B?WUkxbVQ4VitidUxxWmpwQTVVTCt6QjFuK1NicHFaS0lUanc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVZIZVNXZ09MV3d1NEkvaW5ZUEt3S1pKWUlDaTJXZm1IK1Znd1hRYzE0YURk?=
 =?utf-8?B?RmRHMTJsTDBoWlFKQklpT08vVldldFNGNW52UUMzbk80bHBycU5DT01kditl?=
 =?utf-8?B?ZXBIWlA4RGUwYzhGb3dDRmpSTkJ5SDkrMSt6Mkl5ajNkeXVvdTBFNG8rbVdx?=
 =?utf-8?B?bGkvdUk2M3lWOEE4bGF2M2h5Z1hSaVV1SmZncUszb29FOFI3N2pjR1AyWlRw?=
 =?utf-8?B?ZkpNbDN6VXJVaWhPLzdLNUhIbjJsQUZpOEZXc2ZPMkNjUC9CTit1U0RBZWVV?=
 =?utf-8?B?bVVZOERWVnBYVFI3VEtuR2FVVWlUdS8vNCt1VVNWNFlKNnRIRElTY1lDd1Zo?=
 =?utf-8?B?dmhpS2JuRnFkTU9aMHVJSDV3aGtrNkdHSDVxaHBOajk2NVhLMktnQy9WOHN3?=
 =?utf-8?B?Y3pIdDlFUGE2blYzcDNqZUVKbUZHdFVDa1l1SW5Ca0hJZXN6RXIvT3hNY3FY?=
 =?utf-8?B?VjlKem5iTlJKK3lLc1lSTy81YWdyVk44R2FGc3kvMExjRklPblF6eW1nZzNM?=
 =?utf-8?B?NFdVTnRhaXZSMzNKUnF3V2hzMG04NnNPZ0kzQWdVZlpiUnNlV1RQUVNjcUxi?=
 =?utf-8?B?ZUJzQ3B6dTZCNm9lNFM3WDVJdFBkZ1grMEJ3NFZhTXlBQm9kbEhuVlpjalJ2?=
 =?utf-8?B?RFdmbTB0R21BQUtiUkt3VXVYOVU0ckJMYU5NK3lCOHlVZktFakRJY2FsUzZ5?=
 =?utf-8?B?RzI2czJ5bG5DaTltZyt4cE56eGZSZ2hCTHhCVlZWMmpGd1hESVcyZ2VVc2gz?=
 =?utf-8?B?OEpoOStEUVJ0MHd3cTZNa2Y2bWkxWXB0bU5GNU5Wa3VKTHBpQmtBT2c5Ymh3?=
 =?utf-8?B?MUNldDNod3o0cXM0T1Bic2lOcWM5NTFTZ3BEeGJ4WDZ3YVRhakJMZ2pRNlU0?=
 =?utf-8?B?VEFwUTdCUWF5c053bWErdkY0YXBZN2E1SW1JUjU5Ymo0ZmlhWkxDL216N1F2?=
 =?utf-8?B?Mzdma2JZYjZ4MFA5R2JqZE9yTFNyRDhrWEpWQnFYdHFmYnNHYVFZdE5qRmxw?=
 =?utf-8?B?cUw5ODFLQjlWVk10M3FxbkE1Q0tzcEwwOWdGVGtrempKNGwxbTUyZnFjbXNy?=
 =?utf-8?B?TkdjUm5RdC9nSkhDT3gxeW5FOFhtVEczNDIvYVdQbXRrUStKaFAyWlR4U0lX?=
 =?utf-8?B?QVRBL1BtNHdUaFNRWldLMWdtRWdVbjQwSVM3dUlxc3VJTlhqYjQ3VTlYR01F?=
 =?utf-8?B?dis5OXRQSkhCajhyc29XTDZ2OEpPQkwvQS81TDJJanV2VHlYWmlWbVFld3VX?=
 =?utf-8?B?bFR0SnFWczRwYldoTjZjcmJPcExQRnVVS25VY1FSQ3hHT2NxeG0za1grN1h0?=
 =?utf-8?B?cmFpTzMya1VuRUE3LzY1TDJoZDI1cVdZQkROUHFJVFZLZkp4MzIzV25mcW1o?=
 =?utf-8?B?NTc0SWhucHBtZE9KaVZZTG9wTzhiVmowbmx4dVhWQjFZd1ZrWVozNXJ2SDJB?=
 =?utf-8?B?V3BJbDQ4c3JaNmlpMGFBamJvY1lOVzgyVkJEYVNDRmpWRHhVcmRYS3Z1RUJq?=
 =?utf-8?B?YnhjQ0VwVC9ueDVnSzRRQ1dNWFFub3dCUDhWbXExZm1QYzB2dmJJeFZQTlEr?=
 =?utf-8?B?ekpnamhoUE51dEgxN2JoSEh1YitEaXczU01vU2NPaXVDdmhhK0Evd2ZDdXpr?=
 =?utf-8?B?bjJNRVd2VU5Pck1UcUFjT2VjZEw4NnZHNGNXVHg0RTFMdGdxUlZaK3FKTFBa?=
 =?utf-8?B?R25TQk0xaTlVNnlwY3NGeVM0M1cvMTc0QUgybVQ4RE1SVjBEVXVhR0lRYkxR?=
 =?utf-8?B?T2ZmcG9OSFBVQWR6aldlbldUYlE0THVQWjloOTBpMngwSktsejBWR0lzR3lo?=
 =?utf-8?B?aUd6Qm0ycjAyTmJWdmF4NEY3a3A3RWtvYms4cFAwN0JnVXBWaEdDbURyUjVq?=
 =?utf-8?B?b05qeWxTNkIzNFRhSkJEazFSVlA2RnlXTTVyd21ycG1xVU1IMTFTZ1lJTGM2?=
 =?utf-8?B?YUlBSDVhMWVyQTFoNE8rbmFEbVQ3NVBSSWd0VmxhZWN3eFA3MUQrRnVBZzE0?=
 =?utf-8?B?WXB1VTVUNGxkOGtXTWY5a1I5Tm84QklwMVc5ZWZJeVNrRm5FWWE0Qy8zNEc4?=
 =?utf-8?B?WjRZWmVvSHEyYkh6UCtjTVBtMEI4eWlxMmU3Q1JzaVkxUW1xaEV6NEdUVnhq?=
 =?utf-8?Q?1h5Wpg0Xkrkng5igjcVH0j8uH?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: NOkAW11RVqofdvo5pcRJd6vjHIkMblu6oBElcG7v5qdoFHKL+tIH8dN6U8Eh2t6OduiA3yNlv6xEpvLEHhUbusXMur7rEfXX6EU1l+1kVMYWyk/US2UkJXq+Kv0C8JBE32Gx5T+b7XZjJEsoa/rvQsMQUea8scgj1xTxDwAOsaexED0854yDpNFpq+RuCmlSqYMRPxb62wnpABk9ApKYl4Wu1Xp/5kZR/duYK9aRLV+UHSfi4pRVhxyYi5z0a5fDdaFIIHAARKY1G6FD+a9NqVUBSkBDR1Ks+w7TpTJcVWo5QnGsWmo8v/831jpQKGT6hzJ8VVhxj0u9/vAv6u98h967SrRT7myf2I9ZFEhyJb5HDXd9TZJN4VeZ3nB2MgEnxGyobaQvcXCyZsSwJ+f2GKBSbrKayvzwJywtP1SJ4E0KaKGpGXfZB4mnQertLwT0Z1AXROy0ZV9d+DAYfhQef1QuhOUumLCxvzL9RJZ+o0kjAvxC9ekm3EhVkS5nWTQwxFFLxvt5B3fEbYawKB8Z7QeEYP1lv/igMD/qziFGQ0HmWg5KrBWRdR/pAJwL8FaPWaR8HWD3cXGb/hrL3p3WJp7FkrSZLz/62tK/HI++a6A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc9aa13-1573-4c81-d927-08dd1b959325
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 16:45:39.1041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZIcKlMYi35BZBTjVwDmW94HIqQeAoFHOc/iDIljAG8EuZ+/ytrghhhnYubbwbn8M2cF1WZpBSR4G4DdHxPgIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7117
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-13_06,2024-12-12_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412130118
X-Proofpoint-GUID: eGMPyJjqZHKEG29OLhqhBCAffvdbh-Wz
X-Proofpoint-ORIG-GUID: eGMPyJjqZHKEG29OLhqhBCAffvdbh-Wz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_084624_263899_4C998FCB 
X-CRM114-Status: GOOD (  13.09  )
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

KiBMb3JlbnpvIFN0b2FrZXMgPGxvcmVuem8uc3RvYWtlc0BvcmFjbGUuY29tPiBbMjQxMjEzIDEw
OjE2XToKPiBPbiBGcmksIERlYyAxMywgMjAyNCBhdCAxMDowNjo1NUFNIC0wNTAwLCBLYWxlc2gg
U2luZ2ggd3JvdGU6Cj4gPiBPbiBGcmksIERlYyAxMywgMjAyNCBhdCA0OjAw4oCvQU0gTG9yZW56
byBTdG9ha2VzCj4gPiA8bG9yZW56by5zdG9ha2VzQG9yYWNsZS5jb20+IHdyb3RlOgoKLi4uCgo+
ID4KPiA+IE9uIHRoZSB0ZWNobmljYWwgc2lkZSwgTGlhbSBpcyByaWdodCB0aGF0IHRoZSBjb3B5
LXBhc3RlZCBhcmNoIGNvZGUKPiA+IGhhcyBpbmNvbnNpc3RlbmNpZXMgKG1pc3NpbmcgY2hlY2tz
LCBvcmRlciBvZiBjaGVja3MsIC4uLikuIEkgYWdyZWUKPiA+IHRoZXJl4oCZcyByb29tIGZvciBm
dXJ0aGVyIGNvbnNvbGlkYXRpb24uIEnigJlsbCB0YWtlIGFub3RoZXIgc3RhYiBhdCBpdAo+ID4g
YW5kIHJlc2VuZCBpdCBhcyBhbiBSRkMgd2l0aCBhbiB1cGRhdGVkIGNvdmVyIGxldHRlciwgYXMg
TG9yZW56byBhbmQKPiA+IG90aGVycyBzdWdnZXN0ZWQuCgpUaGFua3MuICBDYW4geW91IHBsZWFz
ZSBpbmNsdWRlIHdoYXQgcGxhdGZvcm1zIHlvdSBoYXZlIHRlc3RlZCBpbiB5b3VyCmNvdmVyIGxl
dHRlciAoYW5kIGxldmVsIG9mIHRlc3RpbmcgLSBib290aW5nLCBydW5uaW5nIHNvbWV0aGluZywg
ZXRjKS4KCklmIHlvdSBoYXZlIG5vdCB0ZXN0ZWQgdGhlbSwgdGhlbiBpdCBtaWdodCBiZSB3b3J0
aCBpdCB0byBoYXZlIGl0IGFzIGFuClJGQyB0byBwb2ludCB0aGlzIG91dCAtIGF0IGxlYXN0IGlu
aXRpYWxseS4gIFNvbWUgb2YgdGhlc2UgYXJlIHZlcnkKZGlmZmljdWx0IHRvIHNldCB1cCBmb3Ig
dGVzdGluZywgYnV0IGl0IGlzIGFsc28gcG9zc2libGUgdGhhdCB5b3UgZGlkCnRoYXQgYW5kIHRo
ZSBtYWludGFpbmVycy9wZW9wbGUgd2hvIHVzdWFsbHkgdGVzdCB0aGVzZSB0aGluZ3Mgd2lsbAph
c3N1bWUgaXQncyBmaW5lIGlmIHlvdSBkb24ndCBzcGVsbCBvdXQgd2hhdCdzIGdvaW5nIG9uLgoK
PiAKPiBUaGUgbW9zdCB1c2VmdWwgdGhpbmcgaGVyZSBhcyB3ZWxsIHRvIGhlbHAgdXMgdW5kZXJz
dGFuZCB3b3VsZCBiZSB0byB3cml0ZQo+IG1vcmUgaW4gdGhlIGNvdmVyIGxldHRlciB0byBleHBh
bmQgb24gd2hhdCBpdCBpcyB5b3UgdWx0aW1hdGVseSB3aGF0IHRvCj4gYWNoaWV2ZSBoZXJlIC0g
aXQgc2VlbXMgbGlrZSBhbiBleHRlbnNpb24gb24gdGhlIGV4aXN0aW5nIFRIUCB3b3JrIG9uIGEK
PiBwZXItYXJjaCBiYXNpcyAoSSBtYXkgYmUgd3JvbmcpPyBTbyBhZGRpbmcgbW9yZSBkZXRhaWwg
d291bGQgYmUgc3VwZXIKPiB1c2VmdWwgaGVyZSEgOikKPiAKPiBXZSBkbyBob3BlIHRvIGF2b2lk
IGFyY2ggaG9va3MgaWYgYXQgYWxsIHBvc3NpYmxlIGV4cGxpY2l0bHkgZm9yIHRoZSByZWFzb24K
PiB0aGF0IHRoZXkgY2FuIGJlIGFwcGxpZWQgYXQgdW5mb3J0dW5hdGUgdGltZXMgaW4gdGVybXMg
b2YgbG9ja2luZy93aGV0aGVyCj4gdGhlIG9iamVjdHMgaW4gcXVlc3Rpb24gYXJlIGZ1bGx5L3Bh
cnRpYWxseSBpbnN0YW50aWF0ZWQsIFZNQSB2aXNpYmlsaXR5Cj4gZXRjLiBldGMuIGJhc2VkIG9u
IGhhdmluZyBoYWQgaXNzdWVzIGluIHRoZXNlIGFyZWFzIGJlZm9yZS4KPiAKPiBBbHNvIGlmIGEg
aG9vayBtZWFucyAnYW55dGhpbmcnIGNhbiBoYXBwZW4gYXQgYSBjZXJ0YWluIHBvaW50LCBpdCBt
ZWFucyB3ZQo+IGNhbid0IG1ha2UgYW55IGFzc3VtcHRpb25zIGFib3V0IHdoYXQgaGFzL2hhc24n
dCBhbmQgaGF2ZSB0byBhY2NvdW50IGZvcgo+IGFueXRoaW5nIHdoaWNoIHNlcmlvdXNseSBjb21w
bGljYXRlcyB0aGluZ3MuCj4gCj4gSWRlYWxseSB3ZSdkIGZpbmQgYSBtZWFucyB0byBhY2hpZXZl
IHRoZSBzYW1lIHRoaW5nIHdoaWxlIGFsc28gZXhwb3NpbmcgdXMKPiBhcyBsaXR0bGUgYXMgcG9z
c2libGUgdG8gd2hhdCBtYXkgYmUgbXV0YXRlZC4KCgpZZXMsIEknbSBub3Qgc3VyZSBvZiB3aGF0
IHlvdXIgcGxhbnMgYXJlLCBidXQgSSB3b3VsZCBsaWtlIHRvIHNlZSBhbGwgb2YKdGhlc2UgY3Vz
dG9tIGZ1bmN0aW9ucyByZW1vdmVkLCBpZiBhdCBhbGwgcG9zc2libGUuCgpUaGFua3MsCkxpYW0K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNu
cHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
