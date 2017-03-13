From: till.smejkal@googlemail.com (Till Smejkal)
Date: Mon, 13 Mar 2017 15:45:36 -0700
Subject: [RFC PATCH 11/13] mm/vas: Introduce VAS segments - shareable
 address space regions
In-Reply-To: <20170313222758.GB4033@bombadil.infradead.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170313224536.saqdijtdayxwmlpz@arch-dev>
To: linux-snps-arc@lists.infradead.org

Hi Matthew,

On Mon, 13 Mar 2017, Matthew Wilcox wrote:
> On Mon, Mar 13, 2017@03:14:13PM -0700, Till Smejkal wrote:
> > +/**
> > + * Create a new VAS segment.
> > + *
> > + * @param[in] name:		The name of the new VAS segment.
> > + * @param[in] start:		The address where the VAS segment begins.
> > + * @param[in] end:		The address where the VAS segment ends.
> > + * @param[in] mode:		The access rights for the VAS segment.
> > + *
> > + * @returns:			The VAS segment ID on success, -ERRNO otherwise.
> > + **/
> 
> Please follow the kernel-doc conventions, as described in
> Documentation/doc-guide/kernel-doc.rst.  Also, function documentation
> goes with the implementation, not the declaration.

Thank you for this pointer. I wasn't aware of this convention. I will change the
patches accordingly.

> > +/**
> > + * Get ID of the VAS segment belonging to a given name.
> > + *
> > + * @param[in] name:		The name of the VAS segment for which the ID
> > + *				should be returned.
> > + *
> > + * @returns:			The VAS segment ID on success, -ERRNO
> > + *				otherwise.
> > + **/
> > +extern int vas_seg_find(const char *name);
> 
> So ... segments have names, and IDs ... and access permissions ...
> Why isn't this a special purpose filesystem?

We also thought about this. However, we decided against implementing them as a
special purpose filesystem, mainly because we could not think of a good way to
represent a VAS/VAS segment in this file system (should they be represented rather as
file or directory) and we weren't sure what a hierarchy in the filesystem would mean
for the underlying address spaces. Hence we decided against it and rather used a
combination of IDR and sysfs. However, I don't have any strong feelings and would
also reimplement them as a special purpose filesystem if people rather like them to
be one.

Till
